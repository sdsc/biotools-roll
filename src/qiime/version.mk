NAME               = qiime
VERSION            = 1.8.0
RELEASE            = 0
RPM.EXTRAS         = AutoReq:No
PKGROOT            = /opt/biotools/qiime

SRC_SUBDIR         = qiime

SOURCE_NAME        = qiime-tests
SOURCE_VERSION     = 1.8.0
SOURCE_DIR         = tests
SOURCE_SUFFIX      = tar.gz
SOURCE_PKG         = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)

TAR_GZ_PKGS        = $(SOURCE_PKG)
