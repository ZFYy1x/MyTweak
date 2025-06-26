ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:14.0
THEOS_PACKAGE_SCHEME = roothide

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MyTweak
MyTweak_FILES = Tweak.xm

# 使用 entitlements.plist 进行伪签名（确保路径存在）
MyTweak_CODESIGN_FLAGS = -S./plist/entitlements.plist -w

include $(THEOS_MAKE_PATH)/tweak.mk
