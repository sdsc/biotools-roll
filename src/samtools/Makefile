
REDHAT.ROOT = $(CURDIR)/../../
RPM.EXTRAS=%define __os_install_post /usr/lib/rpm/brp-compress

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk
include $(SDSCDEVEL)/Pull.mk
include $(SDSCDEVEL)/Rules.mk

SAMTOOLS_CACHE = $(REDHAT.ROOT)/cache/build-samtools

$(NAME).spec: DESCRIPTION LICENSE

DESCRIPTION:
	( \
	  $(DESCRIBE_PKG) \
	) > $@

LICENSE: $(SRC_DIRS)
	$(CHECK_LICENSE_FILES)
	echo Expat > $@

build: $(SRC_DIRS)
	( \
	  cd $(SOURCE_DIR); \
	  $(MAKE) LDFLAGS='-ltinfo'; \
          cd htslib-* ; \
          make; \
	)
	@echo "::: Package $(NAME) build complete :::"

install::
	mkdir -p -m 755 $(ROOT)/$(PKGROOT)
	mkdir -p -m 755 $(ROOT)/$(PKGROOT)/lib
	mkdir -p -m 755 $(ROOT)/$(PKGROOT)/include/bam
	( \
	  cd $(SOURCE_DIR); \
	  make prefix=$(ROOT)/$(PKGROOT) install; \
          cp htslib-*/tabix $(ROOT)/$(PKGROOT)/bin; \
          cp htslib-*/*.a $(ROOT)/$(PKGROOT)/lib; \
          cp *.a $(ROOT)/$(PKGROOT)/lib; \
          cp htslib*/libhts.a $(ROOT)/$(PKGROOT)/lib/; \
          cp -r *.h htslib*/htslib $(ROOT)/$(PKGROOT)/include/bam; \
          cp misc/*.java misc/*.pl misc/ace2sam \
              $(ROOT)/$(PKGROOT)/bin/; \
          cp -r examples $(ROOT)/$(PKGROOT); \
	)
	mkdir -p -m 755 $(SAMTOOLS_CACHE)
	cp -r $(ROOT)/$(PKGROOT)/* $(SAMTOOLS_CACHE)/
	$(INSTALL_LICENSE_FILES)
	@echo "::: Package $(NAME) install complete :::"

clean::
	rm -rf $(SOURCE_DIR) DESCRIPTION LICENSE
