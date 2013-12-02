NAME               = fastqc
VERSION            = 0.10.1
RELEASE            = 0
RPM.EXTRAS         = AutoReq: no
PKGROOT            = /opt/biotools/fastqc

SRC_SUBDIR         = fastqc

SOURCE_NAME        = $(NAME)
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = tar.gz
SOURCE_PKG         = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS        = $(SOURCE_PKG)
