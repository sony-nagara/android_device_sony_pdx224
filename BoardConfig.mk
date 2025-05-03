#
# Copyright (C) 2018 The LineageOS Project
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

# Inherit from sony sm8450-common
-include device/sony/sm8450-common/BoardConfigCommon.mk

DEVICE_PATH := device/sony/pdx224

# Display
TARGET_SCREEN_DENSITY := 420

# Kernel
BOARD_KERNEL_CMDLINE += buildproduct=pdx224

TARGET_KERNEL_CONFIG += vendor/sony/pdx224.config

# Add Sailfish kernel config if SAILFISH_BUILD is defined in environment
ifneq ($(strip $(shell echo $$SAILFISH_BUILD)),)
TARGET_KERNEL_CONFIG += vendor/sony/sailfish.config
endif

# Device-specific partition sizes
# data from AOSP config
# Reserve space for data encryption (234859245568-16384)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 234859229184

# Props
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# inherit from the proprietary version
-include vendor/sony/pdx224/BoardConfigVendor.mk
