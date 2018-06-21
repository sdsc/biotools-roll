.PHONY: bioperldownload
REDHAT.ROOT = $(CURDIR)/../../
RPM.EXTRAS=%define __os_install_post /usr/lib/rpm/brp-compress

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk
include $(SDSCDEVEL)/Pull.mk
include $(SDSCDEVEL)/Rules.mk

BIOPERL_CACHE = $(REDHAT.ROOT)/cache/build-bioperl

$(NAME).spec: DESCRIPTION LICENSE

DESCRIPTION:
	( \
	  $(DESCRIBE_PKG) \
	) > $@

LICENSE: $(SRC_DIRS)
	$(CHECK_LICENSE_FILES)
	echo GPL > $@

bioperldownload : $(BIOPERL_PACKAGES)
	for PERL_PACKAGE in $(BIOPERL_PKGS); do \
	   echo "::: Downloading $(DL.SERVER)/$(DL.PATH)/$${PERL_PACKAGE} :::"; \
	   if [ -f $${PERL_PACKAGE} ]; then \
		echo "::: $${PERL_PACKAGE} exists. Skipping... :::" ; \
	   else \
		$(DL.CMD) $(DL.OPTS) $(DL.SERVER)/$(DL.PATH)/$${PERL_PACKAGE} ; \
		echo "::: Verifying size of $${PERL_PACKAGE} :::" ; \
		$(GREP.CMD) `$(STAT.CMD) --printf="%s" $${PERL_PACKAGE}` $(VERIFY.HASHES) ; \
		echo "::: Verifying hash of $${PERL_PACKAGE} :::" ; \
		$(GREP.CMD) `$(VERIFY.CMD) $(VERIFY.OPTS) $${PERL_PACKAGE} ` $(VERIFY.HASHES) ; \
		echo "" ; \
	   fi; \
	   echo "::: Unbundling $${PERL_PACKAGE} :::"; \
	   $(TAR.CMD) $(TGZ.OPTS) $${PERL_PACKAGE}; \
	   echo ""; \
        done
	

build: $(SRC_DIRS) bioperldownload
	patch $(SOURCE_DIR)/Bio/Root/Test.pm patch-files/Test.pm.patch
	perl -pi -e "s!BIOPERLROOT!$(PKGROOT)!g" $(SOURCE_DIR)/Bio/Root/Test.pm
	( \
	   export PERL5LIB=$(BIOPERL_CACHE)/share/perl5; \
	   export PERL5LIB=$(BIOPERL_CACHE)/lib64/perl5:$${PERL5LIB}; \
	   for PERL_PACKAGE in $(BIOPERL_DIRS); do \
              cd $${PERL_PACKAGE}; \
              perl Makefile.PL PREFIX=$(BIOPERL_CACHE); \
              make; \
              make install; \
              cd ..; \
           done \
        )
	rm -rf $(BIOPERL_DIRS)
	@echo "::: Package $(NAME) build complete :::"

install::
	mkdir -p -m 755 $(ROOT)/$(PKGROOT)
	( \
	   export PERL5LIB=$(BIOPERL_CACHE)/share/perl5; \
	   export PERL5LIB=$(BIOPERL_CACHE)/lib64/perl5:$${PERL5LIB}; \
           cd $(SOURCE_DIR); \
           perl Build.PL < ../bioperl_input; \
           ./Build install --install_path script=$(BIOPERL_CACHE)/bin --install_path bindoc=$(BIOPERL_CACHE)/man/man1 --install_path libdoc=$(BIOPERL_CACHE)/man/man3 --install_path lib=$(BIOPERL_CACHE)/share/perl5 --install_path arch=$(BIOPERL_CACHE)/lib64; \
           cp -r $(BIOPERL_CACHE)/* $(ROOT)/$(PKGROOT); \
	   mkdir $(ROOT)/$(PKGROOT)/tests; \
           cp -r t/* $(ROOT)/$(PKGROOT)/tests \
        )
	$(INSTALL_LICENSE_FILES)
	@echo "::: Package $(NAME) install complete :::"

clean:: $(BIOPERL_PACKAGES)
	rm -rf DESCRIPTION LICENSE