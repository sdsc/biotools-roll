PACKAGE     = samtools
CATEGORY    = applications

NAME        = sdsc-$(PACKAGE)-modules
RELEASE     = 0
PKGROOT     = /opt/modulefiles/$(CATEGORY)/$(PACKAGE)

VERSION_SRC = $(REDHAT.ROOT)/src/$(PACKAGE)/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)

EXTRA_MODULE_VERSIONS = 1.2

RPM.EXTRAS  = AutoReq:No
