ifneq ("$(ROLLOPTS)", "$(subst java8home=,,$(ROLLOPTS))")
  override JAVA_HOME = $(subst java8home=,,$(filter java8home=%,$(ROLLOPTS)))
endif

NAME                  = sdsc-picard
VERSION               = 2.18.15
RELEASE               = 0
PKGROOT               = /opt/biotools/picard

SRC_SUBDIR            = picard

SOURCE_NAME           = picard
SOURCE_SUFFIX         = tar.gz
SOURCE_VERSION        = $(VERSION)
SOURCE_PKG            = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR            = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

HTSJDK_NAME    = htsjdk
HTSJDK_SUFFIX  = tar.gz
HTSJDK_VERSION = 2.16.1
HTSJDK_PKG     = $(HTSJDK_NAME)-$(HTSJDK_VERSION).$(HTSJDK_SUFFIX)
HTSJDK_DIR     = $(HTSJDK_PKG:%.$(HTSJDK_SUFFIX)=%)

TAR_GZ_PKGS           = $(SOURCE_PKG) $(HTSJDK_PKG)

RPM.EXTRAS            = AutoReq:No\nAutoProv:No
RPM.PREFIX            = $(PKGROOT)
