#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Include the common OEM chipset BoardConfig.
include device/sony/sm8450-common/BoardConfigCommon.mk

DEVICE_PATH := device/sony/pdx224

# Kernel
TARGET_KERNEL_CONFIG += vendor/sony/pdx224.config

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Include the proprietary files BoardConfig.
include vendor/sony/pdx224/BoardConfigVendor.mk
