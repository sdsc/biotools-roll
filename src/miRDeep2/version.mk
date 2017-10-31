NAME           = sdsc-miRDeep2
VERSION        = 0.0.7
RELEASE        = 2
PKGROOT        = /opt/biotools/miRDeep2

SRC_SUBDIR     = miRDeep2

SOURCE_NAME    = mirdeep2
SOURCE_SUFFIX  = zip
SOURCE_VERSION = 0_0_7
SOURCE_PKG     = $(SOURCE_NAME)_$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

PDF_NAME       =  PDF-API2
PDF_SUFFIX     =  tar.gz
PDF_VERSION    =  2.025
PDF_PKG        =  $(PDF_NAME)-$(PDF_VERSION).$(PDF_SUFFIX)
PDF_DIR        =  $(PDF_PKG:%.$(PDF_SUFFIX)=%)

ZIP_PKGS       = $(SOURCE_PKG)
TAR_GZ_PKGS    = $(PDF_PKG)

RPM.EXTRAS     = AutoReq:No
RPM.PREFIX     = $(PKGROOT)
