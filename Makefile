ARCHS = arm64e arm64
INSTALL_TARGET_PROCESSES = SpringBoard
THEOS_DEVICE_IP = 10.0.0.59
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BigPiPEnergy

BigPiPEnergy_FILES = tweak.xm
BigPiPEnergy_CFLAGS = -fobjc-arc
BigPiPEnergy_EXTRA_FRAMEWORKS += Cephei

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += bigpipenergy
include $(THEOS_MAKE_PATH)/aggregate.mk
