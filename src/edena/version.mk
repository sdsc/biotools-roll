NAME               = edena
VERSION            = 3.131028
RELEASE = 8
RPM.EXTRAS         = "AutoReq: no"
PKGROOT            = /opt/biotools/edena

SRC_SUBDIR         = edena

SOURCE_NAME        = Edena
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = tar.gz
SOURCE_PKG         = $(SOURCE_NAME)V$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS        = $(SOURCE_PKG)
