NAME               = bedtools
VERSION            = 2.20.1
RELEASE            = 0
RPM.EXTRAS         = "AutoReq: no"
PKGROOT            = /opt/biotools/bedtools

SRC_SUBDIR         = bedtools

SOURCE_NAME        = bedtools
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = tar.gz
SOURCE_PKG         = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_NAME)2-$(SOURCE_VERSION)

TAR_GZ_PKGS        = $(SOURCE_PKG)
