NAME           = sdsc-edena
VERSION        = 3.131028
RELEASE        = 16
PKGROOT        = /opt/biotools/edena

SRC_SUBDIR     = edena

SOURCE_NAME    = Edena
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)V$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
