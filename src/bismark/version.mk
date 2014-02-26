NAME               = bismark
VERSION            = 0.10.1
RELEASE            = 0
RPM.EXTRAS         = "AutoReq: no"
PKGROOT            = /opt/biotools/bismark

SRC_SUBDIR         = bismark

SOURCE_NAME        = $(NAME)
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = tar.gz
SOURCE_PKG         = $(SOURCE_NAME)_v$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS        = $(SOURCE_PKG)

