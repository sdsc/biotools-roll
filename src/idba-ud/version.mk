NAME               = ibda-ud
VERSION            = 1.1.1
RELEASE = 8
RPM.EXTRAS         = "AutoReq: no"
PKGROOT            = /opt/biotools/idba-ud

SRC_SUBDIR         = idba

SOURCE_NAME        = idba
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = tar.gz
SOURCE_PKG         = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS        = $(SOURCE_PKG)
