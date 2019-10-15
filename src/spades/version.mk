ifndef ROLLCOMPILER
  ROLLCOMPILER = gnu
endif
COMPILERNAME := $(firstword $(subst /, ,$(ROLLCOMPILER)))

NAME           = sdsc-spades
VERSION        = 3.13.0
RELEASE        = 1
PKGROOT        = /opt/biotools/spades

SRC_SUBDIR     = spades

SOURCE_NAME    = SPAdes
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No\n%global __os_install_post %{nil}\nAutoProv:No
RPM.PREFIX     = $(PKGROOT)
