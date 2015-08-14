# $Id$
#
# @Copyright@
# 
# 				Rocks(r)
# 		         www.rocksclusters.org
# 		         version 5.6 (Emerald Boa)
# 		         version 6.1 (Emerald Boa)
# 
# Copyright (c) 2000 - 2013 The Regents of the University of California.
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
# 	"This product includes software developed by the Rocks(r)
# 	Cluster Group at the San Diego Supercomputer Center at the
# 	University of California, San Diego and its contributors."
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

REDHAT.ROOT = $(CURDIR)/../../

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk
include $(SDSCDEVEL)/Pull.mk
include $(SDSCDEVEL)/Rules.mk

# NOTE: The SeqAN package bundled with tophat fails to compile with the 4.9.x
# gnu compilers.  Until that's fixed, we take steps to use the system gnu.

$(NAME).spec: DESCRIPTION LICENSE

DESCRIPTION:
	if test "$(COMPILERNAME)" != "gnu"; then \
	  $(MODULE_LOAD_CC); \
	fi; \
	( \
	  $(DESCRIBE_PKG); \
	  $(DESCRIBE_CC); \
	  $(DESCRIBE_BOOST); \
	  $(DESCRIBE_EIGEN) \
	) > $@

LICENSE: $(SRC_DIRS)
	$(CHECK_LICENSE_FILES)
	echo OSI and boost > $@

build: $(SRC_DIRS)
	if test "$(COMPILERNAME)" != "gnu"; then \
	  perl -pi -e 's#(typedef.*__int)#//$1#' $(SOURCE_DIR)/src/SeqAn-1.3/seqan/platform/platform_gcc.h; \
	fi
	( \
	  $(MODULE_LOAD_CC); \
	  $(MODULE_LOAD_BOOST); \
	  $(MODULE_LOAD_EIGEN); \
          cd $(OLDSAM_DIR); \
          make; \
          mkdir -p build; \
          mkdir -p build/lib; \
          mkdir -p build/include/bam; \
          cp samtools build/bin/; \
          cp bcftools/bcftools build/bin; \
          cp bcftools/vcfutils.pl build/bin/; \
          cp misc/*.pl build/bin/; \
          cp misc/maq2sam-long build/bin/; \
          cp misc/maq2sam-short build/bin/; \
          cp misc/md5fa build/bin/; \
          cp misc/md5sum-lite build/bin/; \
          cp misc/wgsim build/bin/; \
          cp misc/*.java build/bin/; \
          cp libbam.a build/lib/; \
          cp *.h  build/include/bam; \
          cd ../$(SOURCE_DIR); \
	  if test "$(COMPILERNAME)" = "gnu"; then \
	    export PATH=/usr/bin:${PATH}; \
	  fi; \
	  export CC=$(CC); \
	  export CXX=$(CXX); \
	  export LD_LIBRARY_PATH=$${BOOSTHOME}/lib:$${LD_LIBRARY_PATH}; \
	  ./configure -prefix=$(PKGROOT) \
	    --with-boost=$${BOOSTHOME} --with-eigen=$${EIGENHOME} \
            --with-bam=$(REDHAT.ROOT)/src/tophat/$(OLDSAM_DIR)/build; \
	  $(MAKE) \
	)
	@echo "::: Package $(NAME) build complete :::"

install::
	mkdir -p -m 755 $(ROOT)/$(PKGROOT)
	$(PKGROOT_BIND_MOUNT)
	( \
	  cd $(SOURCE_DIR); \
	  $(MAKE) install \
	)
	$(PKGROOT_BIND_UMOUNT)
	$(INSTALL_LICENSE_FILES)
	@echo "::: Package $(NAME) install complete :::"

clean::
	rm -rf $(SOURCE_DIR) DESCRIPTION LICENSE
