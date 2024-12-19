SKIPUNZIP=0
MODDIR=${0%/*}
alias sh='/system/bin/sh'
alias audio_chip_set='tinymix'
a=$(getprop ro.system.build.version.release)
DEVICE=$(getprop ro.product.name)
Awx="aw882xx_copp_switch"

: <<'HUBER'
Create by HuberHaYu, free
BiliBili - @Huber_HaYu
GitHub - HuberHaYu
HUBER

print_modname() {
  ui_print "***********************"
  echo -e "\x49\x6e\x73\x74\x61\x6c\x6c \x43\x6f\x64\x65 \x42\x79 \x48\x75\x62\x65\x72\x5f\x48\x61\x59\x75"
  ui_print "***********************"
}

check() {
    base64 -d $MODPATH/HX/CI > $MODPATH/CID
    base64 -d $MODPATH/HX/NULLX > $MODPATH/NXD
    base64 -d $MODPATH/HX/X > $MODPATH/X
    # 
    . $MODPATH/NXD
    base64 -d $MODPATH/HX/DA > $DAX_PATH
    . $MODPATH/CID
    . $MODPATH/X
}

gol() {
    base64 -d $MODPATH/HX/D_ > $MODPATH/D__
    # 
    . $MODPATH/D__
    sleep 2
    rm $MODPATH/CID
    rm $MODPATH/NXD
}

okay() {
    echo "安装完成须知！！！"
    echo "Attention!"
    echo "重启后请前往系统控制中心添加“HSX影院模式”磁贴开关"
    echo "After Restarting, go to the System Control Center to add the Tile Switch(HSX Boost)"
    echo "添加并开启此开关以启用完整功能！"
    echo "Add and turn on this switch to enable full functionality!"
    echo " "
    echo "按音量键继续 - Press volume key to continue"
    key_click=""
    while [ "$key_click" = "" ]; do
        key_click="$(getevent -qlc 1 | awk '{ print $3 }' | grep 'KEY_')"
        sleep 0.2
    done
    case "$key_click" in
        "KEY_VOLUMEUP")
            
            ;;
        *)
            :
    esac
}

mixer() {}

vir() {
    # placeholder
}

set_permissions() {
    set_perm_recursive $MODPATH 0 0 0755 0644
    set_perm_recursive  $MODPATH/system/vendor/etc/dolby  0  0  0755  0644 u:object_r:vendor_configs_file:s0
    set_perm_recursive  $MODPATH/system/vendor/etc/audio  0  0  0755  0644 u:object_r:vendor_configs_file:s0
}

set_permissions
print_modname
mixer
check
gol
okay
