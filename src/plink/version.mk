ifndef ROLLCOMPILER
  ROLLCOMPILER = gnu
endif
COMPILERNAME := $(firstword $(subst /, ,$(ROLLCOMPILER)))
NAME           = sdsc-plink
VERSION        = 1.9
RELEASE        = 3
PKGROOT        = /opt/biotools/plink

SRC_SUBDIR     = plink

SOURCE_NAME    = plink
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

ZLIB_NAME      = zlib
ZLIB_SUFFIX    = tar.gz
ZLIB_VERSION   = 1.2.8
ZLIB_PKG       = $(ZLIB_NAME)-$(ZLIB_VERSION).$(ZLIB_SUFFIX)
ZLIB_DIR       = $(ZLIB_PKG:%.$(ZLIB_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG) $(ZLIB_PKG)

RPM.EXTRAS     = AutoReq:No
RPM.PREFIX     = $(PKGROOT)
