NAME           = sdsc-celera
VERSION        = 8.3rc2
RELEASE        = 1
PKGROOT        = /opt/biotools/celera

SRC_SUBDIR     = celera

SOURCE_NAME    = wgs
SOURCE_SUFFIX  = tar.bz2
SOURCE_VERSION = $(VERSION)
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

SAMPLE_NAME    = sampleData
SAMPLE_SUFFIX  = tar.gz
SAMPLE_PKG     = $(SAMPLE_NAME).$(SAMPLE_SUFFIX)
SAMPLE_DIR     = $(SAMPLE_PKG:%.$(SAMPLE_SUFFIX)=%)

STATISTICS_NAME    = Statistics-Descriptive
STATISTICS_SUFFIX  = tar.gz
STATISTICS_VERSION = 3.0612
STATISTICS_PKG     = $(STATISTICS_NAME)-$(STATISTICS_VERSION).$(STATISTICS_SUFFIX)
STATISTICS_DIR     = $(STATISTICS_PKG:%.$(STATISTICS_SUFFIX)=%)

LIST_NAME    = List-MoreUtils
LIST_SUFFIX  = tar.gz
LIST_VERSION = 0.415
LIST_PKG     = $(LIST_NAME)-$(LIST_VERSION).$(LIST_SUFFIX)
LIST_DIR     = $(LIST_PKG:%.$(LIST_SUFFIX)=%)

EXPORTER_NAME    = Exporter-Tiny
EXPORTER_SUFFIX  = tar.gz
EXPORTER_VERSION = 0.042
EXPORTER_PKG     = $(EXPORTER_NAME)-$(EXPORTER_VERSION).$(EXPORTER_SUFFIX)
EXPORTER_DIR     = $(EXPORTER_PKG:%.$(EXPORTER_SUFFIX)=%)

TAR_BZ2_PKGS   = $(SOURCE_PKG)
TAR_GZ_PKGS    = $(SAMPLE_PKG) $(STATISTICS_PKG) $(LIST_PKG) $(EXPORTER_PKG)

RPM.EXTRAS     = AutoReq:No\n%global __os_install_post %{nil}