
REDHAT.ROOT = $(CURDIR)/../../

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk
include $(SDSCDEVEL)/Pull.mk
include $(SDSCDEVEL)/Rules.mk

$(NAME).spec: DESCRIPTION LICENSE

DESCRIPTION:
	$(MODULE_LOAD_CXX); \
	( \
	  $(DESCRIBE_PKG); \
	  $(DESCRIBE_CXX); \
	  $(DESCRIBE_BOOST) \
	) > $@

LICENSE: $(SRC_DIRS)
	$(CHECK_LICENSE_FILES)
	echo GPLv3+ > $@

build: $(SRC_DIRS)
	( \
	  cd $(SOURCE_DIR); \
	  $(MODULE_LOAD_CXX); \
	  $(MODULE_LOAD_BOOST); \
	  perl -pi -e "s#(CXXFLAGS\s*=\s*)#\$$1 -I$${BOOSTHOME}/include #" makefile; \
	  $(MAKE) CXX=$(CXX) \
	)
	@echo "::: Package $(NAME) build complete :::"

install::
	mkdir -p -m 755 $(ROOT)/$(PKGROOT)/bin
	cp $(SOURCE_DIR)/soapsnp $(ROOT)/$(PKGROOT)/bin/
	$(INSTALL_LICENSE_FILES)
	@echo "::: Package $(NAME) install complete :::"

clean::
	rm -rf $(SOURCE_DIR) DESCRIPTION LICENSE
