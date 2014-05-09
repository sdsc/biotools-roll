NAME               = bx-python
VERSION            = 0.7.1
RELEASE            = 0
RPM.EXTRAS         = "AutoReq: no"
PKGROOT            = /opt/biotools/bx-python

SRC_SUBDIR         = bx-python

SOURCE_NAME        = $(NAME)
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = tar.gz
SOURCE_PKG         = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS        = $(SOURCE_PKG)