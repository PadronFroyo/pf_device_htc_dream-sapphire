#
# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PACKAGE_OVERLAYS := device/htc/dream-sapphire/overlay

# Custom App
PRODUCT_PACKAGES := \
   Superuser \
   PowerWidget

# Install the features available on this device.
PRODUCT_COPY_FILES := \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

# Copy prebuilt files
PRODUCT_COPY_FILES += \
    device/htc/dream-sapphire/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml \
    device/htc/dream-sapphire/prebuilt/bin/su:system/bin/su \
    device/htc/dream-sapphire/prebuilt/bin/busybox:system/bin/busybox \
    device/htc/dream-sapphire/prebuilt/media/bootanimation.zip:system/media/bootanimation.zip

# Copy build.prop files
PRODUCT_COPY_FILES += \
    device/htc/dream-sapphire/prebuilt/build.trout.prop:system/build.trout.prop \
    device/htc/dream-sapphire/prebuilt/build.sapphire.prop:system/build.sapphire.prop

# Copy keyboard files for dream
TROUT_KEYMAPDIR := device/htc/dream-sapphire/keymaps/
PRODUCT_COPY_FILES += \
    $(TROUT_KEYMAPDIR)trout-keypad.kcm.bin:/system/usr/keychars/trout-keypad.kcm.bin  \
    $(TROUT_KEYMAPDIR)trout-keypad-v3.kcm.bin:/system/usr/keychars/trout-keypad-v3.kcm.bin  \
    $(TROUT_KEYMAPDIR)trout-keypad-v2.kcm.bin:/system/usr/keychars/trout-keypad-v2.kcm.bin  \
    $(TROUT_KEYMAPDIR)trout-keypad-qwertz.kcm.bin:/system/usr/keychars/trout-keypad-qwertz.kcm.bin  \
    $(TROUT_KEYMAPDIR)trout-keypad.kl:/system/usr/keylayout/trout-keypad.kl  \
    $(TROUT_KEYMAPDIR)trout-keypad-v3.kl:/system/usr/keylayout/trout-keypad-v3.kl  \
    $(TROUT_KEYMAPDIR)trout-keypad-v2.kl:/system/usr/keylayout/trout-keypad-v2.kl  \
    $(TROUT_KEYMAPDIR)trout-keypad-qwertz.kl:/system/usr/keylayout/trout-keypad-qwertz.kl

# media configuration xml file
PRODUCT_COPY_FILES += \
    device/htc/dream-sapphire/media_profiles.xml:/system/etc/media_profiles.xml

PRODUCT_PROPERTY_OVERRIDES := \
    ro.media.dec.jpeg.memcap=10000000

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libhtc_ril.so \
    wifi.interface=tiwlan0

# Time between scans in seconds. Keep it high to minimize battery drain.
# This only affects the case in which there are remembered access points,
# but none are in range.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.supplicant_scan_interval=15

# density in DPI of the LCD of this board. This is used to scale the UI
# appropriately. If this property is not defined, the default value is 160 dpi. 
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160

# Default network type
# 0 => WCDMA Preferred.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=0

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=65536


# proprietary side of the device
$(call inherit-product-if-exists, vendor/htc/dream-sapphire/device_dream_sapphire-vendor.mk)
