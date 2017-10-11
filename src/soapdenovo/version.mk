ifndef ROLLCOMPILER
  ROLLCOMPILER = gnu
endif
COMPILERNAME := $(firstword $(subst /, ,$(ROLLCOMPILER)))

NAME           = sdsc-soapdenovo
VERSION        = 240
RELEASE        = 1
PKGROOT        = /opt/biotools/soapdenovo

SRC_SUBDIR     = soapdenovo

SOURCE_NAME    = SOAPdenovo2
SOURCE_SUFFIX  = tgz
SOURCE_VERSION = 240
SOURCE_PKG     = $(SOURCE_NAME)-src-r$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TGZ_PKGS       = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
RPM.PREFIX     = $(PKGROOT)
