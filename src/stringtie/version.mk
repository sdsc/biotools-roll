NAME           = sdsc-stringtie
VERSION        = 2.1.3b
RELEASE        = 0
PKGROOT        = /opt/biotools/stringtie

SRC_SUBDIR     = stringtie

SOURCE_NAME    = stringtie
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No\nAutoProv:No
RPM.PREFIX     = $(PKGROOT)
