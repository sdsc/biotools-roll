NAME           = sdsc-plink
VERSION        = 1.07
RELEASE        = 16
PKGROOT        = /opt/biotools/plink

SRC_SUBDIR     = plink

SOURCE_NAME    = plink
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
