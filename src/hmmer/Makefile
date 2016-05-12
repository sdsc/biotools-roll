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
RPM.EXTRAS=%define __os_install_post /usr/lib/rpm/brp-compress

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk
include $(SDSCDEVEL)/Pull.mk
include $(SDSCDEVEL)/Rules.mk

$(NAME).spec: DESCRIPTION LICENSE
DESCRIBE_GSL = echo built with gsl $(call GET_MODULE_VERSION, gsl)
MODULE_LOAD_GSL = $(call MODULE_LOAD_PACKAGE, gsl, GSLHOME)

DESCRIPTION:
	$(MODULE_LOAD_CC); \
	( \
	  $(DESCRIBE_PKG); \
	  $(DESCRIBE_CC); \
	  $(DESCRIBE_MPI); \
          $(DESCRIBE_GSL);  \
	  fi \
	) > $@

LICENSE: $(SRC_DIRS)
	$(CHECK_LICENSE_FILES)
	echo GPL > $@

build: $(SRC_DIRS)
	( \
          $(MODULE_LOAD_CC); \
          $(MODULE_LOAD_MPI); \
          $(MODULE_LOAD_GSL); \
	  cd $(SOURCE_DIR); \
          export CC=mpicc; \
          export CFLAGS=-I$${GSLHOME}/include ; \
          export LDFLAGS="-L$${GSLHOME}/lib -lgsl -lgslcblas"; \
          ./configure --prefix=$(ROOT)/$(PKGROOT) --enable-mpi --with-gsl; \
          make V=yes dev \
	)
	@echo "::: Package $(NAME) build complete :::"

install::
	mkdir -p -m 755 $(ROOT)/$(PKGROOT)
	patch $(SOURCE_DIR)/testsuite/i5-hmmbuild-naming.pl patch-files/i5-hmmbuild-naming.pl.patch
	patch $(SOURCE_DIR)/testsuite/i8-nonresidues.pl patch-files/i8-nonresidues.pl.patch
	patch $(SOURCE_DIR)/testsuite/i9-optional-annotation.pl patch-files/i9-optional-annotation.pl.patch
	patch $(SOURCE_DIR)/testsuite/i10-duplicate-names.pl patch-files/i10-duplicate-names.pl.patch
	patch $(SOURCE_DIR)/testsuite/i11-hmmalign-mapali.pl patch-files/i11-hmmalign-mapali.pl.patch
	patch $(SOURCE_DIR)/testsuite/i12-delete-corruption.pl patch-files/i12-delete-corruption.pl.patch
	patch $(SOURCE_DIR)/testsuite/i13-msa-integrity.pl patch-files/i13-msa-integrity.pl.patch
	patch $(SOURCE_DIR)/testsuite/i14-hmmemit-consensus.pl patch-files/i14-hmmemit-consensus.pl.patch
	patch $(SOURCE_DIR)/testsuite/i4-zerolength-seqs.sh patch-files/i4-zerolength-seqs.sh.patch
	patch $(SOURCE_DIR)/testsuite/i15-hmmconvert.pl patch-files/i15-hmmconvert.pl.patch
	patch $(SOURCE_DIR)/testsuite/i16-build-allins.pl patch-files/i16-build-allins.pl.patch
	patch $(SOURCE_DIR)/testsuite/i17-stdin.pl patch-files/i17-stdin.pl.patch
	patch $(SOURCE_DIR)/testsuite/i18-nhmmer-generic.pl patch-files/i18-nhmmer-generic.pl.patch
	patch $(SOURCE_DIR)/testsuite/i19-hmmpgmd-ga.pl patch-files/i19-hmmpgmd-ga.pl.patch
	patch $(SOURCE_DIR)/testsuite/i20-fmindex-core.pl patch-files/i20-fmindex-core.pl.patch
	patch $(SOURCE_DIR)/testsuite/Makefile patch-files/Makefile.patch
	patch $(SOURCE_DIR)/testsuite/testsuite.sqc  patch-files/testsuite.sqc.patch
	( \
	  cd $(SOURCE_DIR); \
          make install; \
          cp -r testsuite $(ROOT)/$(PKGROOT); \
          cp easel/devkit/sqc $(ROOT)/$(PKGROOT)/bin; \
          cp easel/formats/BLOSUM62 $(ROOT)/$(PKGROOT)/testsuite; \
          cp tutorial/*.hmm $(ROOT)/$(PKGROOT)/testsuite; \
          cp tutorial/*.sto $(ROOT)/$(PKGROOT)/testsuite; \
          cp tutorial/HBB_HUMAN $(ROOT)/$(PKGROOT)/testsuite; \
          cd src; \
          cp hmmpress.itest.pl itest_brute alimask hmmalign hmmbuild  \
             hmmconvert hmmemit hmmfetch hmmlogo hmmpress hmmscan \
             hmmsearch hmmsim hmmstat jackhmmer phmmer nhmmer nhmmscan \
             hmmpgmd hmmc2 makehmmerdb hmmerfm-exactmatch \
             $(ROOT)/$(PKGROOT)/bin; \
          cp *_utest $(ROOT)/$(PKGROOT)/bin; \
          cd ..; \
          cp  src/impl/*_utest easel/*_utest $(ROOT)/$(PKGROOT)/bin; \
          cd easel/miniapps; \
          cp esl-afetch esl-alimanip esl-alimap esl-alimask esl-alimerge esl-alipid \
             esl-alistat esl-cluster esl-compalign esl-compstruct esl-construct \
             esl-histplot esl-mask esl-reformat esl-selectn esl-seqrange esl-seqstat \
             esl-sfetch esl-shuffle esl-ssdraw esl-stranslate esl-weight $(ROOT)/$(PKGROOT)/bin \
        )
	$(INSTALL_LICENSE_FILES)
	@echo "::: Package $(NAME) install complete :::"

clean::
	rm -rf $(SOURCE_DIR) DESCRIPTION LICENSE
