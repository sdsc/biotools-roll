# Build of randfold (which depends on squid) fails if squid is compiled
# w/anything but gnu.
override ROLLCOMPILER = gnu
COMPILERNAME := $(firstword $(subst /, ,$(ROLLCOMPILER)))

NAME           = sdsc-squid
VERSION        = 1.9g
RELEASE        = 17
PKGROOT        = /opt/biotools/squid

SRC_SUBDIR     = squid

SOURCE_NAME    = squid
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No
