NAME               = trinity
VERSION            = 2013_08_14
RELEASE            = 1
RPM.EXTRAS         = AutoReq:No
PKGROOT            = /opt/biotools/trinity

SRC_SUBDIR         = trinity

SOURCE_NAME        = $(NAME)
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = tar.gz
SOURCE_PKG         = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS        = $(SOURCE_PKG)

