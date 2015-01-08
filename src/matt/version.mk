NAME           = sdsc-matt
VERSION        = 1.00
RELEASE        = 16
PKGROOT        = /opt/biotools/matt

SRC_SUBDIR     = matt

SOURCE_NAME    = Matt
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-src-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
