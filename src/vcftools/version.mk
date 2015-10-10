ifndef ROLLCOMPILER
  ROLLCOMPILER = gnu
endif
COMPILERNAME := $(firstword $(subst /, ,$(ROLLCOMPILER)))
NAME           = sdsc-vcftools
VERSION        = 0.1.14
RELEASE        = 0
PKGROOT        = /opt/biotools/vcftools

SRC_SUBDIR     = vcftools

SOURCE_NAME    = vcftools
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_HASH    = c7a7337
SOURCE_DIR     = $(SOURCE_NAME)-$(SOURCE_NAME)-$(SOURCE_HASH)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_NAME)-v$(VERSION)-0-g$(SOURCE_HASH).$(SOURCE_SUFFIX)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
