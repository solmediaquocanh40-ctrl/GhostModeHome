TARGET := iphone:clang:latest:15.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = GhostModeHome
GhostModeHome_FILES = Tweak.x
GhostModeHome_CFLAGS = -fobjc-arc
GhostModeHome_FRAMEWORKS = UIKit QuartzCore

include $(THEOS_MAKE_PATH)/tweak.mk
