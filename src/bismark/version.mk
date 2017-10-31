NAME           = sdsc-bismark
VERSION        = 0.15.0
RELEASE        = 1
PKGROOT        = /opt/biotools/bismark

SRC_SUBDIR     = bismark

SOURCE_NAME    = bismark
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)_v$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
RPM.PREFIX     = $(PKGROOT)
