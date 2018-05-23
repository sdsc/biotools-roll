NAME           = sdsc-bowtie2
VERSION        = 2.2.7
RELEASE        = 2
PKGROOT        = /opt/biotools/bowtie2

SRC_SUBDIR     = bowtie2

SOURCE_NAME    = bowtie2
SOURCE_SUFFIX  = zip
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION)-source.$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_NAME)-$(SOURCE_VERSION)

ZIP_PKGS       = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No\nAutoProv:No
RPM.PREFIX     = $(PKGROOT)
