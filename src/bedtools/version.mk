NAME           = sdsc-bedtools
VERSION        = 2.27.1
RELEASE        = 0
PKGROOT        = /opt/biotools/bedtools

SRC_SUBDIR     = bedtools

SOURCE_NAME    = bedtools
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No\nAutoProv:No
RPM.PREFIX     = $(PKGROOT)
