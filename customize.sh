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
