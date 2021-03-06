#
# $Id$
#
# @Copyright@
#
#                               Rocks(r)
#                        www.rocksclusters.org
#                        version 7.0 (Manzanita)
#
# Copyright (c) 2000 - 2017 The Regents of the University of California.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
# 1. Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright
# notice unmodified and in its entirety, this list of conditions and the
# following disclaimer in the documentation and/or other materials provided
# with the distribution.
#
# 3. All advertising and press materials, printed or electronic, mentioning
# features or use of this software must display the following acknowledgement:
#
#       "This product includes software developed by the Rocks(r)
#       Cluster Group at the San Diego Supercomputer Center at the
#       University of California, San Diego and its contributors."
#
# 4. Except as permitted for the purposes of acknowledgment in paragraph 3,
# neither the name or logo of this software nor the names of its
# authors may be used to endorse or promote products derived from this
# software without specific prior written permission.  The name of the
# software includes the following terms, and any derivatives thereof:
# "Rocks", "Rocks Clusters", and "Avalanche Installer".  For licensing of
# the associated name, interested parties should contact Technology
# Transfer & Intellectual Property Services, University of California,
# San Diego, 9500 Gilman Drive, Mail Code 0910, La Jolla, CA 92093-0910,
# Ph: (858) 534-5815, FAX: (858) 534-7345, E-MAIL:invent@ucsd.edu
#
# THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS''
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# @Copyright@
#

REDHAT.ROOT = $(CURDIR)/../../
RPM.EXTRAS=%define __os_install_post /usr/lib/rpm/brp-compress

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk
include $(SDSCDEVEL)/Pull.mk
include $(SDSCDEVEL)/Rules.mk

$(NAME).spec: DESCRIPTION LICENSE

VIENNARNA_CACHE=$(REDHAT.ROOT)/cache/build-viennarna
RANDFOLD_CACHE=$(REDHAT.ROOT)/cache/build-randfold
SQUID_CACHE=$(REDHAT.ROOT)/cache/build-squid
BOWTIE_CACHE=$(REDHAT.ROOT)/cache/build-bowtie

DESCRIPTION:
	$(MODULE_LOAD_CC)
	( \
          $(DESCRIBE_PKG); \
          $(DESCRIBE_CC); \
          $(DESCRIBE_PYTHON) \
        ) > $@

LICENSE: $(SRC_DIRS)
	$(CHECK_LICENSE_FILES)
	echo unknown > $@

build: $(SRC_DIRS)
	patch $(SOURCE_DIR)/install.pl patch-files/install.pl.patch
	( \
	  cd $(PDF_DIR); \
	  perl Makefile.PL PREFIX=$(ROOT)/$(PKGROOT) INSTALL_BASE=''; \
	  $(MAKE); \
          cd ../$(Font-TTF_DIR); \
	  perl Makefile.PL PREFIX=$(ROOT)/$(PKGROOT) INSTALL_BASE=''; \
	  $(MAKE) \
	)
	@echo "::: Package $(NAME) build complete :::"

install::
	mkdir -p -m 755 $(ROOT)/$(PKGROOT)/tests
	mkdir -p -m 755 $(ROOT)/$(PKGROOT)/bin
	( \
          $(MODULE_LOAD_PYTHON); \
          $(MODULE_LOAD_CC); \
	  cd $(PDF_DIR); \
	  $(MAKE) install; \
          cd ../$(Font-TTF_DIR); \
	  $(MAKE) install; \
	  cd ../$(SOURCE_DIR); \
          export PERL5LIB=$(ROOT)/$(PKGROOT)/share/perl5; \
          export PATH=$(VIENNARNA_CACHE)/bin:$${PATH}; \
          export PATH=$(RANDFOLD_CACHE)/bin:$${PATH}; \
          export PATH=$(SQUID_CACHE)/bin:$${PATH}; \
          export PATH=$(BOWTIE_CACHE)/bin:$${PATH}; \
          ./install.pl; \
	  cp src/*.pl $(ROOT)/$(PKGROOT)/bin; \
	  cp -r tutorial_dir/* $(ROOT)/$(PKGROOT)/tests; \
	  cp Rfam_for_miRDeep.fa $(ROOT)/$(PKGROOT); \
          cp install_successful $(ROOT)/$(PKGROOT); \
	  chmod 755 $(ROOT)/$(PKGROOT)/bin/*.pl \
	)
	# Remove $(ROOT) reference from rpm file
	perl -pi -e 's#$(ROOT)##' $(ROOT)/$(PKGROOT)/lib64/perl5/perllocal.pod
	$(INSTALL_LICENSE_FILES)
	@echo "::: Package $(NAME) install complete :::"

clean::
	rm -rf $(SOURCE_DIR) DESCRIPTION LICENSE
