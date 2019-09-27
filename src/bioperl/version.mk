.PHONY:$(BIOPERL_NAMES)
NAME           = sdsc-bioperl
VERSION        = 1.7.2
RELEASE        = 1
PKGROOT        = /opt/biotools/bioperl

BIOPERL_PACKAGES = CPAN-Meta-Requirements-2.140 CPAN-Meta-YAML-0.018 CPAN-Meta-2.150010 Test-Simple-1.302136 Devel-StackTrace-2.03 Exception-Class-1.44 Perl-OSType-1.010 inc-latest-0.500 ExtUtils-MakeMaker-7.34 ExtUtils-CBuilder-0.280230 local-lib-2.000024 JSON-PP-4.00 Test-Harness-3.42 Module-Metadata-1.000033 Module-Build-0.4224 parent-0.236 Sub-Uplevel-0.2800 Capture-Tiny-0.48 Algorithm-Diff-1.1903 Test-Most-0.35 Test-Deep-1.128 Text-Diff-1.45 Test-Differences-0.64 Test-Exception-0.43 Test-Warn-0.32 Bio-ASN1-EntrezGene-1.72 IO-String-1.08 Data-Stag-0.14 Class-Data-Inheritable-0.08

SRC_SUBDIR     = bioperl

SOURCE_NAME    = bioperl-live-release
SOURCE_SUFFIX  = tar.gz
SOURCE_VERSION = 1.7.2
SOURCE_PKG     = $(SOURCE_NAME)-1-7-2.$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)


TAR_GZ_PKGS   = $(SOURCE_PKG) 

TAR_GZ_PKGS: $(BIOPERL_PACKAGES)

RPM.EXTRAS     = AutoReq:No\nAutoProv:No
RPM.PREFIX     = $(PKGROOT)


$(BIOPERL_PACKAGES):
	$(eval PERL_PACKAGE  = $(shell echo $@ |sed 's/-[[:digit:]].[[:digit:]]\+//g'))
	$(eval PERL_PACKAGE_VERSION  = $(shell echo $@ | sed 's/[[:digit:]][a-z]//g' |sed 's/[A-Z][[:digit:]]//g'| sed 's/[[:digit:]][a-z][[:digit:]]//g' |sed 's/[[:digit:]][A-Z]//g'| sed 's/[[:digit:]][a-z]//g' | sed 's/[a-z]*//g' |sed 's/[A-Z]*//g' |sed 's/-//g'))
	$(eval UPPER = $(shell echo $(PERL_PACKAGE) |tr a-z A-Z))
	$(eval $(UPPER)_NAME  = $(PERL_PACKAGE))
	$(eval $(UPPER)_SUFFIX = tar.gz)
	$(eval $(UPPER)_VERSION = $(PERL_PACKAGE_VERSION))
	$(eval $(UPPER)_PKG = $($(UPPER)_NAME)-$($(UPPER)_VERSION).$($(UPPER)_SUFFIX))
	$(eval $(UPPER)_DIR = $($(UPPER)_PKG:%.$($(UPPER)_SUFFIX)=%))
	$(eval BIOPERL_PKGS  += $($(UPPER)_PKG))
	$(eval BIOPERL_DIRS  += $($(UPPER)_DIR))
