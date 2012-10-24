LOCAL_PATH := $(call my-dir)

ifeq ($(BOARD_VENDOR),motorola)

# TODO: Add 8660 when refactored
ifeq ($(call is-board-platform-in-list,msm8960),true)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
endif

