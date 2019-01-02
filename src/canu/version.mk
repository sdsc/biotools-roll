NAME               = sdsc-canu
VERSION            = 1.8
RELEASE            = 0
PKGROOT            = /opt/biotools/canu

SRC_SUBDIR         = canu

SOURCE_NAME        = canu
SOURCE_SUFFIX      = tar.gz
SOURCE_VERSION     = $(VERSION)
SOURCE_PKG         = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

SAMPLE_NAME        = sampleData
SAMPLE_SUFFIX      = tar.gz
SAMPLE_PKG         = $(SAMPLE_NAME).$(SAMPLE_SUFFIX)
SAMPLE_DIR         = $(SAMPLE_PKG:%.$(SAMPLE_SUFFIX)=%)

TAR_GZ_PKGS        = $(SOURCE_PKG) $(SAMPLE_PKG)

RPM.EXTRAS         = AutoReq:No\n%global __os_install_post %{nil}\nAutoProv:No
RPM.PREFIX         = $(PKGROOT)
