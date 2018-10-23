ifndef ROLLCOMPILER
  ROLLCOMPILER = gnu
endif
COMPILERNAME := $(firstword $(subst /, ,$(ROLLCOMPILER)))

NAME           = sdsc-gmap_gsnap
VERSION        = $(shell date -d "$(SOURCE_VERSION)" +%Y%m%d)
RELEASE        = 2
PKGROOT        = /opt/biotools/gmap_gsnap

SRC_SUBDIR     = gmap_gsnap

SOURCE_NAME    = gmap
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = 2018-07-04
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).v7.$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_NAME)-$(SOURCE_VERSION:%.v2=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No\nAutoProv:No
RPM.PREFIX     = $(PKGROOT)
