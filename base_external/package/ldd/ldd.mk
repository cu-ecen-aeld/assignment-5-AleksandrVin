
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
LDD_VERSION = '7d6d4e1606c30fd91ae16e48e690e6e507ae261d'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-AleksandrVin.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = scull
LDD_MODULE_SUBDIRS += misc-modules
LDD_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

$(eval $(kernel-module))

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/sbin
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/sbin
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/sbin
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/sbin
endef

LDD_POST_BUILD_HOOKS += LDD_INSTALL_TARGET_CMDS

$(eval $(generic-package))
