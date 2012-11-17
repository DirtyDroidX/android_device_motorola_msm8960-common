LOCAL_PATH := $(call my-dir)

ifeq ($(BOARD_VENDOR),motorola)
ifeq ($(call is-board-platform-in-list,msm8960),true)
include $(call all-makefiles-under,$(LOCAL_PATH))
include $(all-subdir-makefiles)
endif
endif

