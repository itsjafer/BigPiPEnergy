ARCHS = arm64e arm64
include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = bigpipenergy

bigpipenergy_FILES = bigPPRootListController.mm
bigpipenergy_INSTALL_PATH = /Library/PreferenceBundles
bigpipenergy_FRAMEWORKS = UIKit
bigpipenergy_PRIVATE_FRAMEWORKS = Preferences
bigpipenergy_CFLAGS = -fobjc-arc
bigpipenergy_EXTRA_FRAMEWORKS = Cephei CepheiPrefs

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/bigpipenergy.plist$(ECHO_END)
