ifneq ("$(ROLLOPTS)", "$(subst java8home=,,$(ROLLOPTS))")
  override JAVA_HOME = $(subst java8home=,,$(filter java8home=%,$(ROLLOPTS)))
endif

PACKAGE     = GenomeAnalysisTK
CATEGORY    = applications

NAME        = sdsc-$(PACKAGE)-modules
RELEASE     = 4
PKGROOT     = /opt/modulefiles/$(CATEGORY)/$(PACKAGE)

VERSION_SRC = $(REDHAT.ROOT)/src/$(PACKAGE)/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)

EXTRA_MODULE_VERSIONS = 3.5

RPM.EXTRAS  = AutoReq:No
RPM.PREFIX  = $(PKGROOT)
