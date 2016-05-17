ifneq ("$(ROLLOPTS)", "$(subst java8home=,,$(ROLLOPTS))")
  override JAVA_HOME = $(subst java8home=,,$(filter java8home=%,$(ROLLOPTS)))
endif

NAME           = sdsc-picard
VERSION        = 2.3.0
RELEASE        = 0
PKGROOT        = /opt/biotools/picard

SRC_SUBDIR     = picard

SOURCE_NAME    = picard
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

HTSJDK_SOURCE_NAME    = htsjdk
HTSJDK_SOURCE_SUFFIX  = tar.gz
HTSJDK_SOURCE_VERSION = $(VERSION)
HTSJDK_SOURCE_PKG     = $(HTSJDK_SOURCE_NAME)-$(HTSJDK_SOURCE_VERSION).$(HTSJDK_SOURCE_SUFFIX)
HTSJDK_SOURCE_DIR     = htsjdk

TAR_GZ_PKGS    = $(SOURCE_PKG) $(HTSJDK_SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
