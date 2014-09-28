NAME           = cufflinks
VERSION        = 2.2.0
RELEASE        = 0
PKGROOT        = /opt/biotools/$(NAME)

SRC_SUBDIR     = $(NAME)

SOURCE_NAME    = $(NAME)
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
