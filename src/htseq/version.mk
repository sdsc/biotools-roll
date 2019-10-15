NAME           = sdsc-htseq
VERSION        = 0.11.0
RELEASE        = 1
PKGROOT        = /opt/biotools/htseq

SRC_SUBDIR     = htseq

SOURCE_NAME    = HTSeq
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TAR_GZ_PKGS    = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No\nAutoProv:No\n%global _python_bytecompile_errors_terminate_build 0
RPM.PREFIX     = $(PKGROOT)
