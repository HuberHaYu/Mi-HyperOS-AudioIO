# BiliBili - Huber_HaYu
## 运放芯片及路由处理，勿动！
#!/bin/bash

set_audio_chip() {
    local param=$1
    local value=$2
    audio_chip_set "$param" "$value"
}
set_audio_chip_multiple() {
    local param=$1
    local value=$2
    echo "$param" | grep -q 'Digital Volume' && set_audio_chip "$param" "$value"
    echo "$param" | grep -q 'MODE' && set_audio_chip "$param" "$value"
}
is_device() {
    local device=$1
    [ "$NAME" = "$device" ]
}

# 主逻辑
if audio_chip_set | grep -q 'aw882'; then
    set_audio_chip "aw882xx_copp_switch" "Disable"
    set_audio_chip "aw_dev_1_prof" "Music"
    set_audio_chip "aw_dev_0_prof" "Music"
fi

if ! is_device "zeus" && ! is_device "unicorn"; then
    set_audio_chip_multiple "RX_RX0 Digital Volume" "$v"
    set_audio_chip_multiple "RX_RX1 Digital Volume" "$v"
    set_audio_chip_multiple "RX_RX2 Digital Volume" "$v"
    
    set_audio_chip_multiple "DEC0 MODE" "ADC_HIGH_PERF"
    set_audio_chip_multiple "DEC1 MODE" "ADC_HIGH_PERF"
    set_audio_chip_multiple "DEC2 MODE" "ADC_HIGH_PERF"
    set_audio_chip_multiple "DEC3 MODE" "ADC_HIGH_PERF"
    set_audio_chip_multiple "DEC4 MODE" "ADC_HIGH_PERF"
    set_audio_chip_multiple "DEC5 MODE" "ADC_HIGH_PERF"
    set_audio_chip_multiple "DEC6 MODE" "ADC_HIGH_PERF"
    set_audio_chip_multiple "DEC7 MODE" "ADC_HIGH_PERF"
    echo "ok"
else
    set_audio_chip "BL Boost Target Voltage" "5"
    set_audio_chip "BH Boost Target Voltage" "2"
    set_audio_chip "TL Boost Target Voltage" "5"
    set_audio_chip "TH Boost Target Voltage" "2"
fi

if ! is_device "cas"; then
    tinymix "AMP PCM Gain" 16
    tinymix "RCV AMP PCM Gain" 20
    tinymix "Boost Target Voltage" 10
    tinymix "RCV Boost Target Voltage" 5
fi
## 运放芯片及路由处理，勿动！