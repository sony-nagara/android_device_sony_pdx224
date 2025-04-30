#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
TARGET_SUPPORTS_OMX_SERVICE := false
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from pdx224 device
$(call inherit-product, device/sony/pdx224/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_pdx224
PRODUCT_DEVICE := pdx224
PRODUCT_MANUFACTURER := Sony
PRODUCT_BRAND := Sony
PRODUCT_MODEL := XQ-CQ72

PRODUCT_GMS_CLIENTID_BASE := android-sonymobile

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="XQ-CQ72-user 14 64.2.A.2.272 064002A002027200520422329 release-keys" \
    BuildFingerprint=Sony/XQ-CQ72/XQ-CQ72:14/64.2.A.2.272/064002A002027200520422329:user/release-keys \
    DeviceName=XQ-CQ72 \
    DeviceProduct=XQ-CQ72 \
    SystemDevice=XQ-CQ72 \
    SystemName=XQ-CQ72
