NAME               = trimmomatic
VERSION            = 0.32
RELEASE            = 0
RPM.EXTRAS         = "AutoReq: no"
PKGROOT            = /opt/biotools/trimmomatic

SRC_SUBDIR         = trimmomatic

SOURCE_NAME        = trimmomatic
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = zip
SOURCE_PKG         = Trimmomatic-Src-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_NAME)-$(SOURCE_VERSION)

ZIP_PKGS        = $(SOURCE_PKG)
