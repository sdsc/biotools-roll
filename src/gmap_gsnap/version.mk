NAME               = gmap-gsnap
VERSION            = 2014_02_20
RELEASE            = 0
RPM.EXTRAS         = AutoReq:No
PKGROOT            = /opt/biotools/gmap-gsnap

SRC_SUBDIR         = $(NAME)

SOURCE_NAME        = gmap
SOURCE_VERSION     = 2014-02-20
SOURCE_SUFFIX      = tar.gz
SOURCE_PKG         = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS        = $(SOURCE_PKG)

