#!/system/bin/sh

chmod 777 /data/vendor/dolby/dax_sqlite3.db
alias audio_chip_set='tinymix'
v=89
vh=19
if [ -d "/data/adb/modules/HSX/system/dolby" ]; then
    base64 -d /data/adb/modules/HSX/system/vendor/etc/vendor/lib/key_event/data/vendor/etc/mi/haptic/DD3XQA > /data/adb/modules/HSX/system/vendor/etc/dolby/dax-default.xml
fi
chmod 400 /data/adb/modules/HSX/system/vendor/etc/dolby/dax-default.xml
. /data/adb/modules/HSX/huber.sh