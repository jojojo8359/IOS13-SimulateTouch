# lipoplastic setup for armv6 + arm64 compilation
export ARCHS = arm64
export THEOS_DEVICE_IP = 10.0.0.87

SUBPROJECTS = appdelegate zxtouch-binary pccontrol

include $(THEOS)/makefiles/common.mk
include $(THEOS)/makefiles/aggregate.mk

after-install::
	install.exec "chown -R mobile:mobile /var/mobile/Library/ZXTouch && killall -9 SpringBoard;"

