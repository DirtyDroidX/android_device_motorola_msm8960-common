LOCAL_PATH := $(call my-dir)

ifeq ($(BOARD_VENDOR),motorola)
ifeq ($(call is-board-platform-in-list,msm8960),true)
include $(call all-makefiles-under,$(LOCAL_PATH))
include $(call all-subdir-makefiles-under,$(LOCAL_PATH))
endif
endif

