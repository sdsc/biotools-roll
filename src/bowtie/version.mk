NAME                  = sdsc-bowtie
VERSION               = 1.2.2
RELEASE               = 1
PKGROOT               = /opt/biotools/bowtie

SRC_SUBDIR            = bowtie

SOURCE_NAME           = bowtie
SOURCE_SUFFIX         = zip
SOURCE_VERSION        = $(VERSION)
SOURCE_PKG            = $(SOURCE_NAME)-$(SOURCE_VERSION)-src.$(SOURCE_SUFFIX)
SOURCE_DIR            = $(SOURCE_NAME)-$(SOURCE_VERSION)

ZIP_PKGS              = $(SOURCE_PKG)

RPM.EXTRAS            = AutoReq:No\nAutoProv:No
RPM.PREFIX            = $(PKGROOT)
