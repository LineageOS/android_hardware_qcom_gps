#set TARGET_USES_HARDWARE_QCOM_GPS to false to disable this project.

ifeq ($(TARGET_USES_HARDWARE_QCOM_GPS),)
  ifneq ($(filter sdm845 sdm710, $(TARGET_BOARD_PLATFORM)),)
    TARGET_USES_HARDWARE_QCOM_GPS := false
  else ifeq ($(BOARD_IS_AUTOMOTIVE),true)
    TARGET_USES_HARDWARE_QCOM_GPS := false
  else
    TARGET_USES_HARDWARE_QCOM_GPS := true
  endif
endif

ifeq ($(TARGET_USES_HARDWARE_QCOM_GPS),true)
  ifneq ($(BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE),)
    LOCAL_PATH := $(call my-dir)
    ifeq ($(BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET),true)

      ifneq ($(filter msm8996,$(TARGET_BOARD_PLATFORM)),)
        include $(call all-named-subdir-makefiles,$(TARGET_BOARD_PLATFORM))
      endif #TARGET_BOARD_PLATFORM

    endif #BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET

  endif #BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE
endif
