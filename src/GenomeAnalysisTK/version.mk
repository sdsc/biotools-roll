NAME           = sdsc-GenomeAnalysisTK
VERSION        = 3.4.0
RELEASE        = 0
PKGROOT        = /opt/biotools/GenomeAnalysisTK

SRC_SUBDIR     = GenomeAnalysisTK

SOURCE_NAME    = GenomeAnalysisTK
SOURCE_SUFFIX  = tar.bz2
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_BZ2_PKGS   = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
