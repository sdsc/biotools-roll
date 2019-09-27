NAME           = sdsc-GenomeAnalysisTK
VERSION        = 4.0.11.0
RELEASE        = 1
PKGROOT        = /opt/biotools/GenomeAnalysisTK/$(VERSION)

SRC_SUBDIR     = GenomeAnalysisTK

SOURCE_NAME    = gatk
SOURCE_SUFFIX  = zip
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

ZIP_PKGS       = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No\n%define __jar_repack 0\nAutoProv:No
RPM.PREFIX     = $(PKGROOT)
