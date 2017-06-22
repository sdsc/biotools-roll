ifndef ROLLCOMPILER
  ROLLCOMPILER = gnu
endif
COMPILERNAME := $(firstword $(subst /, ,$(ROLLCOMPILER)))

NAME           = sdsc-qiime
VERSION        = 1.9.1
RELEASE        = 2
PKGROOT        = /opt/biotools/qiime

SRC_SUBDIR     = qiime

SOURCE_NAME    = qiime-tests
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = 1.9.1
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = tests

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
