NAME           = sdsc-velvet
VERSION        = 1.2.10
RELEASE        = 16
PKGROOT        = /opt/biotools/velvet

SRC_SUBDIR     = velvet

SOURCE_NAME    = velvet
SOURCE_SUFFIX  = tgz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)_$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TGZ_PKGS       = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
