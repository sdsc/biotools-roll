NAME           = sdsc-pysam
VERSION        = 0.8.3
RELEASE        = 1
PKGROOT        = /opt/biotools/pysam

SRC_SUBDIR     = pysam

SOURCE_NAME    = pysam
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
