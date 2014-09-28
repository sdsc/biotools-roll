NAME           = qiime
VERSION        = 1.8.0
RELEASE        = 0
PKGROOT        = /opt/biotools/$(NAME)

SRC_SUBDIR     = $(NAME)

SOURCE_NAME    = qiime-tests
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = 1.8.0
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = tests

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
