#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        vendor/lib64/vendor.somc.camera* | vendor/bin/hw/vendor.somc.hardware.camera.*)
            [ "$2" = "" ] && return 0
            grep -q "libutils-v32.so" "${2}" || "${PATCHELF}" --replace-needed "libutils.so" "libutils-v32.so" "${2}"
            grep -q "libhidlbase-v32.so" "${2}" || "${PATCHELF}" --replace-needed "libhidlbase.so" "libhidlbase-v32.so" "${2}"
            grep -q "libbinder-v32.so" "${2}" && return 0
            if ! "${PATCHELF}" --print-needed "${2}" | grep "libbinder.so" > /dev/null; then
                "${PATCHELF}" --add-needed "libbinder-v32.so" "${2}"
            else
                "${PATCHELF}" --replace-needed "libbinder.so" "libbinder-v32.so" "${2}"
            fi
            ;;
        vendor/lib64/libcamximageformatutils.so)
            [ "$2" = "" ] && return 0
            ${PATCHELF} --replace-needed "vendor.qti.hardware.display.config-V2-ndk_platform.so" "vendor.qti.hardware.display.config-V2-ndk.so" "${2}"
            ;;
        *)
            return 1
            ;;
    esac
}

function blob_fixup_dry() {
    blob_fixup "$1" ""
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

# Required!
export DEVICE=pdx224
export DEVICE_COMMON=sm8450-common
export VENDOR=sony

export DEVICE_BRINGUP_YEAR=2022

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
