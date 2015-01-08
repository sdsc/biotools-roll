NAME           = sdsc-ViennaRNA
VERSION        = 2.1.8
RELEASE        = 1
PKGROOT        = /opt/biotools/ViennaRNA

SRC_SUBDIR     = ViennaRNA

SOURCE_NAME    = ViennaRNA
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
