NAME           = sdsc-bedtools
VERSION        = 2.25.0
RELEASE        = 0
PKGROOT        = /opt/biotools/bedtools

SRC_SUBDIR     = bedtools

SOURCE_NAME    = bedtools
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_NAME)2

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
