NAME               = miso
VERSION            = 0.5.2
RELEASE = 13
RPM.EXTRAS         = "AutoReq: no"
PKGROOT            = /opt/biotools/miso

SRC_SUBDIR         = miso

SOURCE_NAME        = yarden-MISO
SOURCE_VERSION     = e0f52c0
SOURCE_SUFFIX      = zip
SOURCE_PKG         = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

ZIP_PKGS        = $(SOURCE_PKG)
