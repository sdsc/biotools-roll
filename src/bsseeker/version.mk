NAME               = bsseeker
VERSION            = 1.0
RELEASE            = 0
RPM.EXTRAS         = "AutoReq: no"
PKGROOT            = /opt/biotools/bsseeker

SRC_SUBDIR         = bsseeker

SOURCE_NAME        = bsseker
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = tgz
SOURCE_PKG         = BS_SEEKER.$(SOURCE_SUFFIX)

TGZ_PKGS        = $(SOURCE_PKG)
