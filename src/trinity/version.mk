NAME              = sdsc-trinity
VERSION           = 2.10.0
RELEASE           = 0
PKGROOT           = /opt/biotools/trinity

SRC_SUBDIR        = trinity

SOURCE_NAME       = trinityrnaseq
SOURCE_SUFFIX     = tar.gz
SOURCE_VERSION    = 2.10.0
SOURCE_PKG        = $(SOURCE_NAME)-v$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR        = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

JELLYFISH_NAME    = jellyfish
JELLYFISH_SUFFIX  = tar.gz
JELLYFISH_VERSION = 2.3.0
JELLYFISH_PKG     = $(JELLYFISH_NAME)-$(JELLYFISH_VERSION).$(JELLYFISH_SUFFIX)
JELLYFISH_DIR     = $(JELLYFISH_PKG:%.$(JELLYFISH_SUFFIX)=%)

SALMON_NAME       = salmon
SALMON_SUFFIX     = zip
SALMON_VERSION    = 1.1.0
SALMON_PKG        = $(SALMON_NAME)-$(SALMON_VERSION).$(SALMON_SUFFIX)
SALMON_DIR        = $(SALMON_PKG:%.$(SALMON_SUFFIX)=%)

TBB_NAME          = oneTBB
TBB_SUFFIX        = zip
TBB_VERSION       = 2019_U8
TBB_PKG           = $(TBB_NAME)-$(TBB_VERSION).$(TBB_SUFFIX)
TBB_DIR           = $(TBB_PKG:%.$(TBB_SUFFIX)=%)

TAR_GZ_PKGS       = $(SOURCE_PKG) $(JELLYFISH_PKG)
ZIP_PKGS          = $(SALMON_PKG) $(TBB_PKG)

RPM.EXTRAS        = AutoReq:No\nAutoProv:No
RPM.PREFIX        = $(PKGROOT)
