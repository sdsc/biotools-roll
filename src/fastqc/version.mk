NAME           = sdsc-fastqc
VERSION        = 0.11.4
RELEASE        = 1
PKGROOT        = /opt/biotools/fastqc

SRC_SUBDIR     = fastqc

SOURCE_NAME    = fastqc
SOURCE_SUFFIX  = zip
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)_v$(SOURCE_VERSION)_source.$(SOURCE_SUFFIX)
SOURCE_DIR     = FastQC

ZIP_PKGS       = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
RPM.PREFIX     = $(PKGROOT)
