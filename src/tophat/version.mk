NAME           = sdsc-tophat
VERSION        = 2.0.13
RELEASE        = 2
PKGROOT        = /opt/biotools/tophat

SRC_SUBDIR     = tophat

SOURCE_NAME    = tophat
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
