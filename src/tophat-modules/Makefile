REDHAT.ROOT = $(CURDIR)/../../

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk
include $(SDSCDEVEL)/Rules.mk

$(VERSION_INC):
	/bin/grep 'VERSION.*=' $(VERSION_SRC) > $@
 
build:

install:: typical-modulefile-install
	( \
             $(MODULE_LOAD_CC); \
             $(MODULE_LOAD_BOOST); \
             perl -pi -e "s!BOOSTHOME!$${BOOSTHOME}!g" $(ROOT)/$(PKGROOT)/$(VERSION) \
        )

clean::
	rm -f $(VERSION_INC)
