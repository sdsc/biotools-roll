NAME           = sdsc-bamtools
VERSION        = 2.3.0
RELEASE        = 16
PKGROOT        = /opt/biotools/bamtools

SRC_SUBDIR     = bamtools

SOURCE_NAME    = bamtools
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
