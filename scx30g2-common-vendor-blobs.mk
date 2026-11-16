# Proprietary blobs for scx30g2-common, taken from the working LineageOS 14.1 (7.1.2) dump
# and adapted to Android 9 (Lineage 16). See VENDOR_NOTES.md for what was kept/dropped and why.

PROPRIETARIES := \
    bin/at_distributor \
    bin/ext_data.sh \
    bin/ext_kill.sh \
    bin/ext_symlink.sh \
    bin/gps.cer \
    bin/gpsd \
    bin/modem_control \
    bin/modemd \
    bin/npsmobex \
    bin/nvitemd \
    bin/phoneserver \
    bin/prepare_param.sh \
    bin/refnotify \
    bin/sswap \
    etc/media_codecs_performance.xml \
    etc/wifi/bcmdhd_apsta.bin \
    etc/wifi/bcmdhd_mfg.bin \
    etc/wifi/bcmdhd_sta.bin \
    etc/wifi/nvram_mfg.txt \
    lib/egl/libGLES_mali.so \
    lib/hw/gps.default.so \
    lib/hw/gralloc.sc8830.so \
    lib/libatparser.so \
    lib/libfactoryutil.so \
    lib/liblcsagent.so \
    lib/libomission_avoidance.so \
    lib/libomx_aacdec_sprd.so \
    lib/libomx_avcdec_hw_sprd.so \
    lib/libomx_avcdec_sw_sprd.so \
    lib/libomx_avcenc_hw_sprd.so \
    lib/libomx_m4vh263dec_hw_sprd.so \
    lib/libomx_m4vh263dec_sw_sprd.so \
    lib/libomx_m4vh263enc_hw_sprd.so \
    lib/libomx_mp3dec_sprd.so \
    lib/libomx_vpxdec_hw_sprd.so \
    lib/libreference-ril_sp.so \
    lib/libsecnativefeature.so \
    lib/soundfx/libaudioeffectoffload.so \
    vendor/firmware/BCM43430A1_V0034.0089.hcd \
    vendor/firmware/vbc_eq

PRODUCT_COPY_FILES += \
    $(foreach f,$(PROPRIETARIES),vendor/samsung/scx30g2-common/proprietary/$(f):system/$(f))
