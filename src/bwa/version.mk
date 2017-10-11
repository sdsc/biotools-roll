NAME           = sdsc-bwa
VERSION        = 0.7.13
RELEASE        = 1
PKGROOT        = /opt/biotools/bwa

SRC_SUBDIR     = bwa

SOURCE_NAME    = bwa
SOURCE_SUFFIX  = tar.bz2
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_BZ2_PKGS   = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
RPM.PREFIX     = $(PKGROOT)
