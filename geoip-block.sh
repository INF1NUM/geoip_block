#!/bin/bash
. /opt/geoip_block/etc/geoip_block.conf

show_help() {
    echo "This is help for script GeoIP block"
}

apply_iptables() {
    while read line
    do
    echo "Read file $1 "
    if [[ $(iptables -S) == *"${line}"* ]]; then
        echo "Skip: rule alredy exist (${line})"
    else
        echo "Apply iptables rule: $line "
        iptables $line
    fi
    done < $1
}

apply() {
    echo "Apply ipsets from ${DATADIR}"
    find $DATADIR \( -name "*.netset" -or -name "*.ipset" \) -exec ${BINDIR}/ipset-apply.sh {} \;
    #find $CONFIGDIR -name "*.rule" -exec apply_iptables {} \;
    apply_iptables ${CONFIGDIR}/iptables.rule
}

update() {
    mkdir -p $DATADIR
    rm ${DATADIR}/*
    cd $DATADIR
    wget -nv -i ${CONFIGDIR}/url.list
    apply
}

if [ -z $1 ]; then
    # If params emty show help
    show_help
else
    case "$1" in
    "update")
        update
        ;;
    "apply")
        apply
        ;;
    *)
        echo "Unknown command: $1"
        show_help
        ;;
    esac
fi
