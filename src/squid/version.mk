NAME           = sdsc-squid
VERSION        = 1.9g
RELEASE        = 16
PKGROOT        = /opt/biotools/squid

SRC_SUBDIR     = squid

SOURCE_NAME    = squid
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
