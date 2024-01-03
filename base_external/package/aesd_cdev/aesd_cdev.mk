
##############################################################
#
# AESD_CDEV
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_CDEV_VERSION = 'b49f4b1ca5cc42f3c3a8900c93c09b7a27ff1e8c'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_CDEV_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-AleksandrVin.git'
AESD_CDEV_SITE_METHOD = git
AESD_CDEV_GIT_SUBMODULES = YES

AESD_CDEV_MODULE_SUBDIRS = aesd-char-driver
AESD_CDEV_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

$(eval $(kernel-module))

define AESD_CDEV_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/sbin
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/sbin
endef

AESD_CDEV_POST_BUILD_HOOKS += AESD_CDEV_INSTALL_TARGET_CMDS

$(eval $(generic-package))
