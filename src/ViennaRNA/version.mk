NAME                = sdsc-ViennaRNA
VERSION             = 2.4.10
RELEASE             = 0
PKGROOT             = /opt/biotools/ViennaRNA

SRC_SUBDIR          = ViennaRNA

SOURCE_NAME         = ViennaRNA
SOURCE_SUFFIX       = tar.gz
SOURCE_VERSION      = $(VERSION)
SOURCE_PKG          = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR          = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

EXTUTILS_NAME       =  ExtUtils-Embed
EXTUTILS_SUFFIX     =  tar.gz
EXTUTILS_VERSION    =  1.14
EXTUTILS_PKG        =  $(EXTUTILS_NAME)-$(EXTUTILS_VERSION).$(EXTUTILS_SUFFIX)
EXTUTILS_DIR        =  $(EXTUTILS_PKG:%.$(EXTUTILS_SUFFIX)=%)

TAR_GZ_PKGS         = $(SOURCE_PKG) $(EXTUTILS_PKG)

RPM.EXTRAS          = AutoReq:No\nAutoProv:No
RPM.PREFIX          = $(PKGROOT)
