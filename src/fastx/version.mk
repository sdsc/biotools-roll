NAME                  = fastx
VERSION               = 0.0.13.2
RELEASE               = 0
RPM.EXTRAS            = AutoReq:No
PKGROOT               = /opt/biotools/fastx

SRC_SUBDIR            = fastx

SOURCE_NAME           = $(NAME)
SOURCE_VERSION        = $(VERSION)
SOURCE_SUFFIX         = tar.bz2
SOURCE_PKG            = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR            = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

LIBGTEXTUTILS_NAME    = libgtextutils
LIBGTEXTUTILS_VERSION = 0.6.1
LIBGTEXTUTILS_PKG     = $(LIBGTEXTUTILS_NAME)-$(LIBGTEXTUTILS_VERSION).$(SOURCE_SUFFIX)
LIBGTEXTUTILS_DIR     = $(LIBGTEXTUTILS_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_BZ2_PKGS          = $(SOURCE_PKG) $(LIBGTEXTUTILS_PKG)

