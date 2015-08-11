NAME           = sdsc-vcftools
VERSION        = 0.1.12b
RELEASE        = 0
PKGROOT        = /opt/biotools/vcftools

SRC_SUBDIR     = vcftools

SOURCE_NAME    = vcftools
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)_$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
