NAME               = GenomeAnalysisTK
VERSION            = 2.8.1
RELEASE            = 0
RPM.EXTRAS         = AutoReq:No
PKGROOT            = /opt/biotools/GenomeAnalysisTK

SRC_SUBDIR         = GenomeAnalysisTK

SOURCE_NAME        = $(NAME)
SOURCE_VERSION     = 2.8.1
SOURCE_SUFFIX      = tar.bz2
SOURCE_PKG         = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
EXTENDED_VERSION    = 2.8-1-g932cd3a
SOURCE_DIR         = $(SOURCE_NAME)-$(EXTENDED_VERSION)

TAR_BZ2_PKGS       = $(SOURCE_NAME)-$(VERSION).$(SOURCE_SUFFIX)
