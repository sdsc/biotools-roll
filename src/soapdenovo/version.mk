NAME               = soapdenovo
VERSION            = r240
RELEASE            = 0
RPM.EXTRAS         = AutoReq:No
PKGROOT            = /opt/biotools/soapdenovo

SRC_SUBDIR         = soapdenovo

SOURCE_NAME        = SOAPdenovo2
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = tgz
SOURCE_PKG         = $(SOURCE_NAME)-src-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TGZ_PKGS           = $(SOURCE_PKG)

