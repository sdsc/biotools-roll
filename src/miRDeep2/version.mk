NAME               = miRDeep2
VERSION            = 0.0.5
RELEASE            = 0
RPM.EXTRAS         = "AutoReq: no"
PKGROOT            = /opt/biotools/miRDeep2

SRC_SUBDIR         = miRDeep2

SOURCE_NAME        = mirdeep2
SOURCE_VERSION     = 0_0_5
SOURCE_SUFFIX      = zip
SOURCE_PKG         = $(SOURCE_NAME)_$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = mirdeep2

PDF_NAME           =  PDF-API2
PDF_VERSION        =  2.021
PDF_SUFFIX         =  tar.gz
PDF_PKG            =  $(PDF_NAME)-$(PDF_VERSION).$(PDF_SUFFIX)
PDF_DIR            =  $(PDF_PKG:%.$(PDF_SUFFIX)=%)

ZIP_PKGS        = $(SOURCE_PKG)
TAR_GZ_PKGS     = $(PDF_PKG)