# Copyright 2014 The Android Open Source Project
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

# Bootanimation
TARGET_BOOTANIMATION_SIZE := 1080x608

# Inherit device parts
$(call inherit-product, device/sony/suzu/device.mk)
$(call inherit-product, frameworks/native/build/phone-xxxhdpi-3072-dalvik-heap.mk)
$(call inherit-product, frameworks/native/build/phone-xxxhdpi-3072-hwui-memory.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# kernel
TARGET_KERNEL_CONFIG := aosp_loire_suzu_defconfig

# prebuilt kernel
TARGET_KERNEL_MODULES := true
BOARD_KERNEL_IMAGE_NAME := kernel
TARGET_PREBUILT_KERNEL := device/sony/suzu/kernel

# Override Product Name for OmniROM
PRODUCT_DEVICE := suzu
PRODUCT_NAME := omni_suzu
PRODUCT_MODEL := Xperia X
PRODUCT_BRAND := Sony
PRODUCT_MANUFACTURER := Sony

# Assert
TARGET_OTA_ASSERT_DEVICE := F5121,F5122,suzu

# Suzu Props
TARGET_SYSTEM_PROP += device/sony/suzu/system.prop

# Inherit OmniROM parts
$(call inherit-product, vendor/omni/config/gsm.mk)
