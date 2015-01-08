NAME           = sdsc-blat
VERSION        = 35
RELEASE        = 16
PKGROOT        = /opt/biotools/blat

SRC_SUBDIR     = blat

SOURCE_NAME    = blatSrc
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)_$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
