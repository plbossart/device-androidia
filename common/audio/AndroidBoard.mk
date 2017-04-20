LOCAL_PATH := $(call my-dir)

# Android-defined variables
USE_XML_AUDIO_POLICY_CONF := 1
USE_CONFIGURABLE_AUDIO_POLICY := 1

# Intel-defined variables
# USE_STUB_AUDIO_HAL := 1

ifeq ($(USE_STUB_AUDIO_HAL), 1)

# this option only enables USB, A2DP and remote submix audio.
# the audio.primary.default HAL is part of the build to pass
# CTS tests but only acts as a NULL sink/source

AUDIO_HARDWARE := stub

else

# audio hardware is not discoverable, select hardware or use basic default
AUDIO_HARDWARE := default
#AUDIO_HARDWARE := PCH-CX20724
#AUDIO_HARDWARE := nuc
#AUDIO_HARDWARE := nuc-skull-canyon

endif #BOARD_USES_GENERIC_AUDIO

###########################################
# Audio stack Package
###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := audio_configuration_files
LOCAL_MODULE_TAGS := optional

ifeq ($(USE_XML_AUDIO_POLICY_CONF), 1)
LOCAL_REQUIRED_MODULES := \
    audio_policy_configuration.xml \
    a2dp_audio_policy_configuration.xml \
    usb_audio_policy_configuration.xml \
    r_submix_audio_policy_configuration.xml \
    audio_policy_volumes.xml \
    default_volume_tables.xml \
    mixer_paths_0.xml
else
LOCAL_REQUIRED_MODULES := \
    audio_policy.conf \
    mixer_paths
endif

include $(BUILD_PHONY_PACKAGE)

###########################################
# Audio Policy Configuration file
###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := audio_policy_configuration.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)
LOCAL_SRC_FILES := $(AUDIO_HARDWARE)/audio_policy_configuration.xml
include $(BUILD_PREBUILT)
###########################################

###########################################
# Audio Policy Configuration file
###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := a2dp_audio_policy_configuration.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)
LOCAL_SRC_FILES := default_audio_policy_config/a2dp_audio_policy_configuration.xml
include $(BUILD_PREBUILT)
###########################################

###########################################
# Audio Policy Configuration file
###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := usb_audio_policy_configuration.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)
LOCAL_SRC_FILES := default_audio_policy_config/usb_audio_policy_configuration.xml
include $(BUILD_PREBUILT)
###########################################

###########################################
# Audio Policy Configuration file
###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := r_submix_audio_policy_configuration.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)
LOCAL_SRC_FILES := default_audio_policy_config/r_submix_audio_policy_configuration.xml
include $(BUILD_PREBUILT)
###########################################

###########################################
# Audio Policy Configuration file
###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := audio_policy_volumes.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)
LOCAL_SRC_FILES := default_audio_policy_config/audio_policy_volumes.xml
include $(BUILD_PREBUILT)
###########################################

###########################################
# Audio Policy Configuration file
###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := default_volume_tables.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)
LOCAL_SRC_FILES := default_audio_policy_config/default_volume_tables.xml
include $(BUILD_PREBUILT)
###########################################

###########################################
# Audio Policy Configuration file
###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := audio_policy.conf
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)
LOCAL_SRC_FILES := $(AUDIO_HARDWARE)/audio_policy.conf
include $(BUILD_PREBUILT)
###########################################

###########################################
# Audio HAL Custom configuration file
###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := mixer_paths_0.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)
ifneq ($(USE_STUB_AUDIO_HAL), 1)
LOCAL_SRC_FILES := $(AUDIO_HARDWARE)/mixer_paths_0.xml
endif
include $(BUILD_PREBUILT)
###########################################

ifeq ($(USE_CONFIGURABLE_AUDIO_POLICY), 1)
include device/intel/android_ia/common/audio/reference_configurable_audio_policy/AndroidBoard.mk
endif
