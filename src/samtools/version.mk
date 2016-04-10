NAME           = sdsc-samtools
VERSION        = 1.3
RELEASE        = 1
PKGROOT        = /opt/biotools/samtools/$(VERSION)

SRC_SUBDIR     = samtools

SOURCE_NAME    = samtools
SOURCE_SUFFIX  = tar.bz2
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_BZ2_PKGS   = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
