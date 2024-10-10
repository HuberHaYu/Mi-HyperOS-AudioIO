#!/system/bin/sh
alias audio_chip_set='tinymix'
v=91
vh=19
MODDIR=${0%/*}
wait_until_login() {
    while [ "$(getprop sys.boot_completed)" != "1" ]; do
        sleep 1
    done
    while [ ! -d "/sdcard/Android" ]; do
        sleep 1
    done
    sleep 0.5s
    base64 $MODDIR/system/vendor/etc/dolby/dax-default.xml > $MODDIR/system/vendor/etc/dolby/DD3XQA
    rm $MODDIR/system/vendor/etc/dolby/dax-default.xml
    mkdir -p $MODDIR/system/vendor/etc/vendor/lib/key_event/data/vendor/etc/mi/haptic
    NA=$MODDIR/system/vendor/etc/vendor/lib/key_event/data/vendor/etc/mi/haptic
    cp -f $MODDIR/system/vendor/etc/dolby/DD3XQA $NA
    rm $MODDIR/system/vendor/etc/dolby/DD3XQA
    mkdir -p $MODDIR/system/dolby
    #monitor
    while true; do
        . $MODDIR/huber.sh
        sleep 120
    done
}
wait_until_login
