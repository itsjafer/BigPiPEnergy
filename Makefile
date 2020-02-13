INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BigPiPEnergy

BigPiPEnergy_FILES = tweak.xm
BigPiPEnergy_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += bigpipenergy
include $(THEOS_MAKE_PATH)/aggregate.mk
