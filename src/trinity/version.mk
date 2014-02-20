NAME               = trinity
VERSION            = 20131110
RELEASE            = 1
RPM.EXTRAS         = AutoReq:No
PKGROOT            = /opt/biotools/trinity

SRC_SUBDIR         = trinity

SOURCE_NAME        = trinityrnaseq
SOURCE_VERSION     = r20131110
SOURCE_SUFFIX      = tar.gz
SOURCE_PKG         = $(SOURCE_NAME)_$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS        = $(SOURCE_PKG)
