NAME           = sdsc-trimmomatic
VERSION        = 0.35
RELEASE        = 1
PKGROOT        = /opt/biotools/trimmomatic

SRC_SUBDIR     = trimmomatic

SOURCE_NAME    = trimmomatic
SOURCE_SUFFIX  = zip
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = Trimmomatic-Src-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_NAME)-$(SOURCE_VERSION)

ZIP_PKGS       = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
RPM.PREFIX     = $(PKGROOT)
