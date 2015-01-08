NAME           = sdsc-trinity
VERSION        = 20140717
RELEASE        = 1
PKGROOT        = /opt/biotools/trinity

SRC_SUBDIR     = trinity

SOURCE_NAME    = trinityrnaseq
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = r20140717
SOURCE_PKG     = $(SOURCE_NAME)_$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
