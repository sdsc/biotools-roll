NAME           = sdsc-picard
VERSION        = 2.1.0
RELEASE        = 0
PKGROOT        = /opt/biotools/picard

SRC_SUBDIR     = picard

SOURCE_NAME    = broadinstitute-picard
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS       = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
