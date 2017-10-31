VERSION        = 3.5
NAME           = sdsc-GenomeAnalysisTK-$(VERSION)
RELEASE        = 1
PKGROOT        = /opt/biotools/GenomeAnalysisTK/$(VERSION)

SRC_SUBDIR     = GenomeAnalysisTK

SOURCE_NAME    = GenomeAnalysisTK
SOURCE_SUFFIX  = tar.bz2
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_BZ2_PKGS   = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
RPM.PREFIX     = $(PKGROOT)
