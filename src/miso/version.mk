NAME           = sdsc-miso
VERSION        = 0.5.4
RELEASE        = 1
PKGROOT        = /opt/biotools/miso

SRC_SUBDIR     = miso

SOURCE_NAME    = misopy
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = 0.5.4
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No\nAutoProv:No\n%global _python_bytecompile_errors_terminate_build 0
RPM.PREFIX     = $(PKGROOT)
