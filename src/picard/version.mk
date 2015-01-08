NAME           = sdsc-picard
VERSION        = 1.119
RELEASE        = 1
PKGROOT        = /opt/biotools/picard

SRC_SUBDIR     = picard

SOURCE_NAME    = picard-tools
SOURCE_SUFFIX  = zip
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

ZIP_PKGS       = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
