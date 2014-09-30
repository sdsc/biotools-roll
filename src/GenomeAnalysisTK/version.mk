NAME             = GenomeAnalysisTK
VERSION          = 2.8.1
RELEASE          = 15
PKGROOT          = /opt/biotools/$(NAME)

SRC_SUBDIR       = $(NAME)

SOURCE_NAME      = $(NAME)
SOURCE_SUFFIX    = tar.bz2
SOURCE_VERSION   = $(VERSION)
SOURCE_PKG       = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
EXTENDED_VERSION = 2.8-1-g932cd3a
SOURCE_DIR       = $(SOURCE_NAME)-$(EXTENDED_VERSION)

TAR_BZ2_PKGS     = $(SOURCE_PKG)

RPM.EXTRAS       = AutoReq:No
