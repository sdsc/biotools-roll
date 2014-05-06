NAME               = pysam
VERSION            = 0.7.8pre
RELEASE = 10
RPM.EXTRAS         = "AutoReq: no"
PKGROOT            = /opt/biotools/pysam

SRC_SUBDIR         = pysam

SOURCE_NAME        = $(NAME)
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = tar.gz
SOURCE_PKG         = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_NAME)-master

TAR_GZ_PKGS        = $(SOURCE_PKG)
