#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# AAPT
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Overlay
PRODUCT_PACKAGES += \
    FrameworkRes-PDX224-Overlay \
    SettingsProvider-PDX224-Overlay \
    SystemUIRes-PDX224-Overlay

DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay-lineage

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit from the common OEM chipset makefile.
$(call inherit-product, device/sony/sm8450-common/common.mk)

# Inherit from the proprietary files makefile.
$(call inherit-product, vendor/sony/pdx224/pdx224-vendor.mk)
