NAME           = velvet
VERSION        = 1.2.10
RELEASE        = 16
PKGROOT        = /opt/biotools/$(NAME)

SRC_SUBDIR     = $(NAME)

SOURCE_NAME    = $(NAME)
SOURCE_SUFFIX  = tgz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)_$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TGZ_PKGS       = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
