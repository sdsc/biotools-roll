NAME           = sdsc-hisat2
VERSION        = 2.1.0
RELEASE        = 0
PKGROOT        = /opt/biotools/hisat2

SRC_SUBDIR     = hisat2

SOURCE_NAME    = hisat2
SOURCE_SUFFIX  = zip
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION)-source.$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_NAME)-$(SOURCE_VERSION)

ZIP_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No\nAutoProv:No
RPM.PREFIX     = $(PKGROOT)
