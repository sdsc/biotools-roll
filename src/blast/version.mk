# Intel 2018 compile fails with
# ncbitype.h(71): error: #error directive: "Unsupported size of char(must be 1 byte)"
override ROLLCOMPILER = gnu
COMPILERNAME := $(firstword $(subst /, ,$(ROLLCOMPILER)))

NAME           = sdsc-blast
VERSION        = 2.7.1
RELEASE        = 0
PKGROOT        = /opt/biotools/blast

SRC_SUBDIR     = blast

SOURCE_NAME    = ncbi-blast
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION)+-src.$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No\nAutoProv:No
RPM.PREFIX     = $(PKGROOT)
