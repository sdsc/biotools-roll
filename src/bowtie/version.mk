NAME           = sdsc-bowtie
VERSION        = 1.1.1
RELEASE        = 1
PKGROOT        = /opt/biotools/bowtie

SRC_SUBDIR     = bowtie

SOURCE_NAME    = bowtie
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_NAME)-$(SOURCE_VERSION)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
