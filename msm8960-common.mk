COMMON_FOLDER := device/motorola/msm8960-common

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

## The gps config appropriate for this device
PRODUCT_COPY_FILES += \
	device/motorola/msm8960-common/configs/gps.conf:system/etc/gps.conf


## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/motorola/msm8960-common/msm8960-common-vendor.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += $(COMMON_FOLDER)/overlay

# EGL config
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/configs/egl.cfg:system/lib/egl/egl.cfg

# Media config
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/configs/media_codecs.xml:system/etc/media_codecs.xml
#    $(COMMON_FOLDER)/configs/media_profiles.xml:system/etc/media_profiles.xml

# Audio configuration
PRODUCT_COPY_FILES += \
	$(COMMON_FOLDER)/audio/snd_soc_msm_2x:system/etc/snd_soc_msm/snd_soc_msm_2x \
	$(COMMON_FOLDER)/audio/audio_policy.conf:system/etc/audio_policy.conf \
	$(COMMON_FOLDER)/audio/audio_effects.conf:system/etc/audio_effects.conf

# SafeStrap files
PRODUCT_COPY_FILES += \
    system/core/rootdir/init.rc:system/etc/rootfs/init.rc \
    system/core/rootdir/ueventd.rc:system/etc/rootfs/ueventd.rc \
    $(COMMON_FOLDER)/safestrap/init.qcom.rc:system/etc/rootfs/init.qcom.rc \
    $(COMMON_FOLDER)/rootdir/init.target.rc:system/etc/rootfs/init.target.rc \
    $(COMMON_FOLDER)/rootdir/ueventd.qcom.rc:system/etc/rootfs/ueventd.qcom.rc \
    $(COMMON_FOLDER)/safestrap/default.prop:system/etc/rootfs/default.prop \
    $(COMMON_FOLDER)/safestrap/prima/cfg80211.ko:system/lib/modules/prima/cfg80211.ko \
    $(COMMON_FOLDER)/safestrap/prima/prima_wlan.ko:system/lib/modules/prima/prima_wlan.ko \
    $(OUT)/root/sbin/adbd:system/etc/rootfs/sbin/adbd \
    $(OUT)/fake_packages/init2:system/etc/rootfs/init

# CM-specific init file for SafeStrap
PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/etc/init.local.rc:system/etc/rootfs/init.cm.rc

# Audio
PRODUCT_PACKAGES += \
    alsa.msm8960 \
    audio.a2dp.default \
    audio_policy.msm8960 \
    audio.primary.msm8960 \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler

# Bluetooth
PRODUCT_PACKAGES += \
    hci_qcomm_init

# HAL
PRODUCT_PACKAGES += \
    copybit.msm8960 \
    gralloc.msm8960 \
    hwcomposer.msm8960 \
    power.msm8960

# GPS
#PRODUCT_PACKAGES += \
#    libloc_adapter \
#    libloc_eng \
#    libloc_api_v02 \
#    libgps.utils \
#    gps.msm8960

# Lights
PRODUCT_PACKAGES += lights.msm8960

# NFC Support
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := $(COMMON_FOLDER)/configs/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := $(COMMON_FOLDER)/configs/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

# QCOM Display
PRODUCT_PACKAGES += \
    libgenlock \
    liboverlay

# Omx
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libOmxCore \
    libOmxVenc \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libstagefrighthw

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    resize2fs \
    setup_fs

# for bugmailer
PRODUCT_PACKAGES += send_bug
PRODUCT_COPY_FILES += \
    system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
    system/extras/bugmailer/send_bug:system/bin/send_bug

# Init scripts and ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.mmi.usb.rc \
    init.mmi.usb.sh \
    init.msm.rc \
    init.qcom.class_core.sh \
    init.qcom.class_main.sh \
    init.qcom.early_boot.sh \
    init.qcom.rc \
    init.qcom.sh \
    init.qcom.syspart_fixup.sh \
    init.qcom.usb.sh \
    init.target.rc \
    init.vzw.rc \
    ueventd.qcom.rc \
    init.ath3k.bt.sh \
    init.qcom.bt.sh \
    init.qcom.coex.sh \
    init.qcom.efs.sync.sh \
    init.qcom.fm.sh \
    init.qcom.mdm_links.sh \
    init.qcom.modem_links.sh \
    init.qcom.post_boot.sh \
    init.qcom.sdio.sh \
    init.qcom.thermald_conf.sh \
    init.qcom.wifi.sh \
    usf_post_boot.sh

# Torch
PRODUCT_PACKAGES += Torch

# STK
PRODUCT_PACKAGES += Stk

# Charger
PRODUCT_PACKAGES += charger charger_res_images

# QRNGD
PRODUCT_PACKAGES += qrngd

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# strace
PRODUCT_PACKAGES += strace

# Motorola Binaries
PRODUCT_PACKAGES += \
    batt_health \
    charge_only_mode \
    graphicsd \
    modemlog \
    mot_boot_mode \
    motobox \
    recover_userdata

# symlinks
PRODUCT_PACKAGES += \
    wiperiface \
    WCNSS_qcom_wlan_nv.bin

# wifi
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/wififirmware/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(COMMON_FOLDER)/wififirmware/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
    $(COMMON_FOLDER)/wififirmware/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
    $(COMMON_FOLDER)/wififirmware/WCNSS_qcom_wlan_nv_regulatory.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv_regulatory.bin

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# keylayouts
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/keylayout/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
    $(COMMON_FOLDER)/keylayout/atmxt-i2c.kl:system/usr/keylayout/atmxt-i2c.kl \
    $(COMMON_FOLDER)/keylayout/Button_Jack.kl:system/usr/keylayout/Button_Jack.kl \
    $(COMMON_FOLDER)/keylayout/cyttsp-i2c.kl:system/usr/keylayout/cyttsp-i2c.kl \
    $(COMMON_FOLDER)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(COMMON_FOLDER)/keylayout/keypad_8960.kl:system/usr/keylayout/keypad_8960.kl \
    $(COMMON_FOLDER)/keylayout/keypad_8960_liquid.kl:system/usr/keylayout/keypad_8960_liquid.kl \
    $(COMMON_FOLDER)/keylayout/msm8960-snd-card_Button_Jack.kl:system/usr/keylayout/msm8960-snd-card_Button_Jack.kl \
    $(COMMON_FOLDER)/keylayout/philips_remote_ir.kl:system/usr/keylayout/philips_remote_ir.kl \
    $(COMMON_FOLDER)/keylayout/samsung_remote_ir.kl:system/usr/keylayout/samsung_remote_ir.kl \
    $(COMMON_FOLDER)/keylayout/ue_rf4ce_remote.kl:system/usr/keylayout/ue_rf4ce_remote.kl

# Vold configuration
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/vold.fstab:system/etc/vold.fstab

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Increase the HWUI font cache since we have tons of RAM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.text_cache_width=2048

# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/system/lib/libqc-opt.so

# QCOM
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true

# Radio and Telephony
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-qc-qmi-1.so \
    ril.subscription.types=NV,RUIM \
    persist.radio.eons.enabled= true \
    keyguard.no_require_sim=true \
    ro.use_data_netmgrd=true \
    ro.ril.transmitpower=true \
    persist.radio.call_type=1 \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.radio.dfr_mode_set=1 \
    persist.gps.qmienabled=true \
    ro.config.vc_call_vol_steps=7 \
    ro.qc.sdk.camera.facialproc=false \
    ro.qc.sdk.sensors.gestures=false \
    persist.timed.enable=true

# QCOM Display
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=1 \
    debug.egl.hw=1 \
    debug.enabletr=0 \
    debug.composition.type=gpu \
    debug.mdpcomp.maxlayer=3 \
    debug.mdpcomp.logs=0

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.fluence.mode=endfire \
    persist.audio.vr.enable=false \
    persist.audio.handset.mic=digital \
    ro.qc.sdk.audio.fluencetype=fluence \
    ro.qc.sdk.audio.ssr=false

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bluetooth.hfp.ver=1.6 \
    ro.qualcomm.bluetooth.sap=true \
    ro.qualcomm.bt.hci_transport=smd \
    ro.bluetooth.request.master=true \
    ro.bluetooth.remote.autoconnect=true

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    lpa.decode=false \
    lpa.use-stagefright=true \
    media.stagefright.enable-player=true \
    media.stagefright.enable-http=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-qcp=true \
    media.stagefright.enable-fma2dp=true \
    media.stagefright.enable-scan=true \
    mmp.enable.3g2=true \
    af.resampler.quality=255 \
    mpq.audio.decode=true

# OpenglES
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

# # adb has root
PRODUCT_PROPERTY_OVERRIDES += persist.sys.root_access=3

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/motorola/msm8960-common/jb_caf_adreno.mk)
