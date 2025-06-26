ARCHS = arm64 arm64e
THEOS_PACKAGE_SCHEME = roothide

TARGET = iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = MyTweak

MyTweak_FILES = Tweak.xm

MyTweak_CODESIGN_FLAGS = --entitlements ./plist/entitlements.plist

include $(THEOS_MAKE_PATH)/tweak.mk
