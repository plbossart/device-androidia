LOCAL_PATH := $(call my-dir)
PFW_CORE := external/parameter-framework
BUILD_PFW_SETTINGS := $(PFW_CORE)/support/android/build_pfw_settings.mk
PFW_DEFAULT_SCHEMAS_DIR := $(PFW_CORE)/upstream/schemas
PFW_SCHEMAS_DIR := $(PFW_DEFAULT_SCHEMAS_DIR)

###########################################
# Audio stack Package
###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := audio_hal_nuc
LOCAL_MODULE_TAGS := optional
LOCAL_REQUIRED_MODULES := \
    libremote-processor \
    remote-process \
    nuc_audio_policy.conf \
    nuc_route_criteria.conf \
    AudioConfigurableDomains.xml \
    AudioConfigurableDomains-AR.xml \
    RouteConfigurableDomains.xml

include $(BUILD_PHONY_PACKAGE)

###########################################
# Audio Policy Configuration file
###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := nuc_audio_policy.conf
LOCAL_MODULE_STEM := audio_policy.conf
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR_ETC)
LOCAL_SRC_FILES := audio_policy.conf
include $(BUILD_PREBUILT)
###########################################

###########################################
# Audio HAL Custom configuration file
###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := nuc_route_criteria.conf
LOCAL_MODULE_STEM := route_criteria.conf
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR_ETC)
LOCAL_SRC_FILES := route_criteria.conf
include $(BUILD_PREBUILT)
###########################################

###########################################
# Audio PFW Package
###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := AudioConfigurableDomains.xml
LOCAL_MODULES_TAGS := optional
LOCAL_ADDITIONAL_DEPENDENCIES := \
    AudioParameterFramework.xml \
    AudioClass.xml \
    ConexantCX20724Subsystem.xml \
    HdmiSubsystem.xml

LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_RELATIVE_PATH := parameter-framework/Settings/Audio
LOCAL_REQUIRED_MODULES := \
    libtinyalsa-subsystem

PFW_TOPLEVEL_FILE := $(TARGET_OUT_ETC)/parameter-framework/AudioParameterFramework.xml
PFW_CRITERIA_FILE := $(LOCAL_PATH)/parameter-framework/AudioCriteria.txt
#PFW_TUNING_FILE   := $(LOCAL_PATH)/$(LOCAL_MODULE_RELATIVE_PATH)/AudioConfigurableDomains-Tuning.xml

PFW_EDD_FILES := \
    $(LOCAL_PATH)/$(LOCAL_MODULE_RELATIVE_PATH)/routing_cx20724.pfw \
    $(LOCAL_PATH)/$(LOCAL_MODULE_RELATIVE_PATH)/routing_hdmi.pfw

include $(BUILD_PFW_SETTINGS)

###########################################
# Audio PFW top file
###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := AudioParameterFramework.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_RELATIVE_PATH := parameter-framework
LOCAL_SRC_FILES := parameter-framework/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)
###########################################

###########################################
# Audio PFW Structure files
###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := AudioClass.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_RELATIVE_PATH := parameter-framework/Structure/Audio
LOCAL_SRC_FILES := $(LOCAL_MODULE_RELATIVE_PATH)/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := ConexantCX20724Subsystem.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_RELATIVE_PATH := parameter-framework/Structure/Audio
LOCAL_SRC_FILES := $(LOCAL_MODULE_RELATIVE_PATH)/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := HdmiSubsystem.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_RELATIVE_PATH := parameter-framework/Structure/Audio
LOCAL_SRC_FILES := $(LOCAL_MODULE_RELATIVE_PATH)/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)
###########################################

###########################################
# Audio PFW Package for audio route
###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := AudioConfigurableDomains-AR.xml
LOCAL_MODULES_TAGS := optional
LOCAL_ADDITIONAL_DEPENDENCIES := \
    AudioParameterFramework-AR.xml \
    AudioClass-AR.xml \
    ConexantCX20724Subsystem-AR.xml \
    HdmiSubsystem.xml \
    mixer_paths.xml

LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_RELATIVE_PATH := parameter-framework/Settings/Audio
LOCAL_REQUIRED_MODULES := \
     libtinyalsa-subsystem \
     libaudioroute-subsystem

PFW_TOPLEVEL_FILE := $(TARGET_OUT_ETC)/parameter-framework/AudioParameterFramework-AR.xml
PFW_CRITERIA_FILE := $(LOCAL_PATH)/parameter-framework/AudioCriteria.txt
#PFW_TUNING_FILE   := $(LOCAL_PATH)/$(LOCAL_MODULE_RELATIVE_PATH)/AudioConfigurableDomains-Tuning.xml

PFW_EDD_FILES := \
    $(LOCAL_PATH)/$(LOCAL_MODULE_RELATIVE_PATH)/routing_cx20724-ar.pfw \
    $(LOCAL_PATH)/$(LOCAL_MODULE_RELATIVE_PATH)/routing_hdmi.pfw

include $(BUILD_PFW_SETTINGS)

###########################################
# Audio PFW top file
###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := AudioParameterFramework-AR.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_RELATIVE_PATH := parameter-framework
LOCAL_SRC_FILES := parameter-framework/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)
###########################################

###########################################
# Audio PFW Structure files
###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := AudioClass-AR.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_RELATIVE_PATH := parameter-framework/Structure/Audio
LOCAL_SRC_FILES := $(LOCAL_MODULE_RELATIVE_PATH)/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := ConexantCX20724Subsystem-AR.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_RELATIVE_PATH := parameter-framework/Structure/Audio
LOCAL_SRC_FILES := $(LOCAL_MODULE_RELATIVE_PATH)/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := mixer_paths.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR_ETC)
LOCAL_SRC_FILES := parameter-framework/Settings/Audio/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

###########################################
# Route PFW Package
###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := RouteConfigurableDomains.xml
LOCAL_MODULES_TAGS := optional
LOCAL_ADDITIONAL_DEPENDENCIES := \
    RouteParameterFramework.xml \
    RouteClass.xml \
    RouteSubsystem.xml \
    RouteSubsystem-RoutesTypes.xml

LOCAL_MODUL_CLASS := ETC
LOCAL_MODULE_RELATIVE_PATH := parameter-framework/Settings/Route

PFW_TOPLEVEL_FILE := $(TARGET_OUT_ETC)/parameter-framework/RouteParameterFramework.xml
PFW_CRITERIA_FILE := $(LOCAL_PATH)/parameter-framework/RouteCriteria.txt
PFW_EDD_FILES := \
    $(LOCAL_PATH)/$(LOCAL_MODULE_RELATIVE_PATH)/route-applicability.pfw \
    $(LOCAL_PATH)/$(LOCAL_MODULE_RELATIVE_PATH)/route-configuration.pfw

include $(BUILD_PFW_SETTINGS)


###########################################
# Route PFW top file
###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := RouteParameterFramework.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_RELATIVE_PATH := parameter-framework
LOCAL_SRC_FILES := parameter-framework/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)
###########################################

###########################################
# Route PFW Structure files
###########################################
include $(CLEAR_VARS)
LOCAL_MODULE := RouteClass.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_RELATIVE_PATH := parameter-framework/Structure/Route
LOCAL_SRC_FILES := $(LOCAL_MODULE_RELATIVE_PATH)/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := RouteSubsystem.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_RELATIVE_PATH := parameter-framework/Structure/Route
LOCAL_SRC_FILES := $(LOCAL_MODULE_RELATIVE_PATH)/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := RouteSubsystem-RoutesTypes.xml
LOCAL_MODULE_OWNER := intel
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_RELATIVE_PATH := parameter-framework/Structure/Route
LOCAL_SRC_FILES := $(LOCAL_MODULE_RELATIVE_PATH)/$(LOCAL_MODULE)
include $(BUILD_PREBUILT)
###########################################

