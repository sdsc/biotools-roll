NAME               = samtools
VERSION            = 0.1.19
RELEASE            = 1
RPM.EXTRAS         = AutoReq:No
PKGROOT            = /opt/biotools/samtools

SRC_SUBDIR         = samtools

SOURCE_NAME        = $(NAME)
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = tar.bz2
SOURCE_PKG         = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_BZ2_PKGS       = $(SOURCE_PKG)

