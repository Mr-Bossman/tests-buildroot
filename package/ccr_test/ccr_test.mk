
################################################################################
#
# CCR_TEST
#
################################################################################

CCR_TEST_VERSION = 1.0
CCR_TEST_SITE = $(CCR_TEST_PKGDIR)/ccr_test
CCR_TEST_SITE_METHOD = local
CCR_TEST_INSTALL_TARGET = YES

define CCR_TEST_BUILD_CMDS
	$(TARGET_CC) $(@D)/ccr_test.c -o $(@D)/ccr_test
endef

define CCR_TEST_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/ccr_test $(TARGET_DIR)/usr/bin/ccr_test
endef

$(eval $(generic-package))
