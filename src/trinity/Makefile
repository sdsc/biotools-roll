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

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk
include $(SDSCDEVEL)/Pull.mk
include $(SDSCDEVEL)/Rules.mk

$(NAME).spec: DESCRIPTION LICENSE

override ROLLCOMPILER = gnu
COMPILERNAME          = gnu

DESCRIPTION:
	$(MODULE_LOAD_CC) 
	( \
	  $(DESCRIBE_PKG); \
          $(DESCRIBE_PYTHON); \
          $(DESCRIBE_CC); \
          $(DESCRIBE_BOOST) \
	) > $@

LICENSE: $(SRC_DIRS)
	$(CHECK_LICENSE_FILES)
	echo BSD > $@

build: $(SRC_DIRS)
	patch $(SOURCE_DIR)/sample_data/test_Trinity_Assembly/runMe.sh \
	  patch-files/runMe.sh.patch
	patch $(SALMON_DIR)/CMakeLists.txt patch-files/CMakeLists.txt.patch
	perl -pi -e "s!ROLLPREFIX!$(PKGROOT)!g" $(SOURCE_DIR)/Makefile
	perl -pi -e "s!ROLLPREFIX!$(PKGROOT)!g" \
          $(SOURCE_DIR)/sample_data/test_Trinity_Assembly/runMe.sh
	perl -pi -e "s!ROLLPATH!$(CURDIR)!g" $(SALMON_DIR)/CMakeLists.txt
	@echo "::: Package $(NAME) build complete :::"

install::
	mkdir -p -m 755 $(ROOT)/$(PKGROOT)
	$(PKGROOT_BIND_MOUNT)
	( \
          $(MODULE_LOAD_PYTHON);  \
          $(MODULE_LOAD_CMAKE); \
          $(MODULE_LOAD_CC); \
          $(MODULE_LOAD_BOOST); \
          rm -rf $(REDHAT.ROOT)/src/trinity/bin; \
          mkdir $(REDHAT.ROOT)/src/trinity/bin; \
          ln -s `which python3` $(REDHAT.ROOT)/src/trinity/bin/python; \
          export $PATH=$(REDHAT.ROOT)/src/trinity/bin:$${PATH}; \
          export CC=`which $(CC)`; \
          export CXX=`which $(CXX)`; \
          cd $(JELLYFISH_DIR); \
          ./configure --prefix=$(PKGROOT); \
          make -j `/bin/nproc --ignore=2`; \
          make install; \
          cd ../$(SALMON_DIR); \
          mkdir build; \
          cd build; \
          cmake -DCMAKE_INSTALL_PREFIX=$(PKGROOT) -DCMAKE_CXX_COMPILER=`which $(CXX)` -DCMAKE_C_COMPILER=`which $(CC)` -DBOOST_INCLUDEDIR=$${BOOSTHOME}/include -DBOOST_LIBRARYDIR=$${BOOSTHOME}/lib -DEXTRA_CMAKE_LIBRARY_FLAGS=-lstdc++ -DNO_IPO=TRUE ..; \
          make -j `/bin/nproc --ignore=2`; \
          make install; \
          cd ../../$(SOURCE_DIR); \
          export FORCE_UNSAFE_CONFIGURE=1; \
          mkdir bin; \
          $(MAKE); \
          $(MAKE) plugins; \
          cd trinity-plugins; \
          make trinity_essentials; \
          cd ..; \
          cp -r * $(PKGROOT); \
          PYTHONFILES=`find $(PKGROOT) -name \*.py`; \
          for file in $${PYTHONFILES};  do \
                sed -i 's/#\!\/usr\/bin\/env python$$/#\!\/usr\/bin\/env python3/' $${file}; \
 	        sed -i 's/#\!\/usr\/bin\/python$$/#\!\/usr\/bin\/python3/' $${file}; \
          done; \
          rm -rf $(REDHAT.ROOT)/src/trinity/bin \
        )
	$(PKGROOT_BIND_UMOUNT)
	$(INSTALL_LICENSE_FILES)
	@echo "::: Package $(NAME) install complete :::"

clean::
	rm -rf $(SOURCE_DIR) DESCRIPTION LICENSE
