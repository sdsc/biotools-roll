NAME           = sdsc-NucleoATAC
VERSION        = 0.3.4
RELEASE        = 0
PKGROOT        = /opt/biotools/NucleoATAC

SRC_SUBDIR     = NucleoATAC

SOURCE_NAME    = NucleoATAC
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No\nAutoProv:No
RPM.PREFIX     = $(PKGROOT)
