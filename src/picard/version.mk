NAME           = picard
VERSION        = 1.119
RELEASE        = 0
PKGROOT        = /opt/biotools/$(NAME)

SRC_SUBDIR     = $(NAME)

SOURCE_NAME    = picard-tools
SOURCE_SUFFIX  = zip
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

ZIP_PKGS       = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
