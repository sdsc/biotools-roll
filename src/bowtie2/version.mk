NAME               = bowtie2
VERSION            = 2.2.3
RELEASE            = 0
RPM.EXTRAS         = AutoReq:No
PKGROOT            = /opt/biotools/bowtie2

SRC_SUBDIR         = bowtie2

SOURCE_NAME        = $(NAME)
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = zip
SOURCE_PKG         = $(SOURCE_NAME)-$(SOURCE_VERSION)-source.$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_NAME)-$(SOURCE_VERSION)

ZIP_PKGS           = $(SOURCE_PKG)

