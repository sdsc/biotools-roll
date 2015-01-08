NAME           = sdsc-miso
VERSION        = 0.5.2
RELEASE        = 16
PKGROOT        = /opt/biotools/miso

SRC_SUBDIR     = miso

SOURCE_NAME    = misopy
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = 0.5.2
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
