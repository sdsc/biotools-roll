NAME               = bowtie
VERSION            = 1.0.0
RELEASE            = 0
RPM.EXTRAS         = AutoReq:No
PKGROOT            = /opt/biotools/bowtie

SRC_SUBDIR         = bowtie

SOURCE_NAME        = $(NAME)
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = zip
SOURCE_PKG         = $(SOURCE_NAME)-$(SOURCE_VERSION)-src.$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_NAME)-$(SOURCE_VERSION)

ZIP_PKGS           = $(SOURCE_PKG)

