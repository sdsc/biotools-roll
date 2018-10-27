NAME             = sdsc-miRDeep2
VERSION          = 0.0.8
RELEASE          = 0
PKGROOT          = /opt/biotools/miRDeep2

SRC_SUBDIR       = miRDeep2

SOURCE_NAME      = mirdeep2
SOURCE_SUFFIX    = zip
SOURCE_VERSION   = 0_0_8
SOURCE_PKG       = $(SOURCE_NAME)_$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR       = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

PDF_NAME         =  PDF-API2
PDF_SUFFIX       =  tar.gz
PDF_VERSION      =  2.033
PDF_PKG          =  $(PDF_NAME)-$(PDF_VERSION).$(PDF_SUFFIX)
PDF_DIR          =  $(PDF_PKG:%.$(PDF_SUFFIX)=%)

Font-TTF_NAME    =  Font-TTF
Font-TTF_SUFFIX  =  tar.gz
Font-TTF_VERSION =  1.06
Font-TTF_PKG     =  $(Font-TTF_NAME)-$(Font-TTF_VERSION).$(Font-TTF_SUFFIX)
Font-TTF_DIR     =  $(Font-TTF_PKG:%.$(Font-TTF_SUFFIX)=%)

ZIP_PKGS         = $(SOURCE_PKG)
TAR_GZ_PKGS      = $(PDF_PKG) $(Font-TTF_PKG)

RPM.EXTRAS       = AutoReq:No\nAutoProv:No
RPM.PREFIX       = $(PKGROOT)
