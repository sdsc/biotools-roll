NAME              = sdsc-trinity
VERSION           = 2.8.4
RELEASE           = 0
PKGROOT           = /opt/biotools/trinity

SRC_SUBDIR        = trinity

SOURCE_NAME       = trinityrnaseq-Trinity
SOURCE_SUFFIX     = tar.gz
SOURCE_VERSION    = 2.8.4
SOURCE_PKG        = $(SOURCE_NAME)-v$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR        = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

JELLYFISH_NAME    = jellyfish
JELLYFISH_SUFFIX  = tar.gz
JELLYFISH_VERSION = 2.2.10
JELLYFISH_PKG     = $(JELLYFISH_NAME)-v$(JELLYFISH_VERSION).$(JELLYFISH_SUFFIX)
JELLYFISH_DIR     = $(JELLYFISH_PKG:%.$(JELLYFISH_SUFFIX)=%)

TAR_GZ_PKGS       = $(SOURCE_PKG) $(JELLYFISH_PKG)

RPM.EXTRAS        = AutoReq:No\nAutoProv:No
RPM.PREFIX        = $(PKGROOT)
