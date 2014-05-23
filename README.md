# SDSC "biotools" roll

## Overview

This roll bundles a collection of Biology packages: blat, bowtie, bwa,
GenomeAnalysisTK, samtools, soapdenovo, and velvet.

For more information about the various biology packages included in the biotools
roll please visit their official web pages:

- <a href="http://biopython.org" target="_blank">biopython</a>
- <a href="http://blast.ncbi.nlm.nih.gov/Blast.cgi" target="_blank">blast</a>
- <a href="http://https://pypi.python.org/pypi/bx-python" target="_blank">bx-python</a>
- <a href="http://genome.ucsc.edu/goldenPath/help/blatSpec.html" target="_blank">blat</a>
- <a href="http://bowtie-bio.sourceforge.net" target="_blank">bowtie</a>
- <a href="http://bowtie-bio.sourceforge.net/bowtie2" target="_blank">bowtie2</a>
- <a href="http://bio-bwa.sourceforge.net" target="_blank">bwa</a>
- <a href="http://cufflinks.cbcb.umd.edu" target="_blank">cufflinks</a>
- <a href="http://pythonhosted.org/DendroPy" target="_blank">dendropy</a>
- <a href="http://www.genomic.ch/edena.php" target="_blank">edena</a>
- <a href="http://www.bioinformatics.babraham.ac.uk/projects/fastqc" target="_blank">fastqc</a>
- <a href="http://hannonlab.cshl.edu/fastx_toolkit" target="_blank">fastx</a>
- <a href="http://www.broadinstitute.org/gatk" target="_blank">GenomeAnalysisTK</a>
- <a href="http://research-pub.gene.com/gmap" target="_blank">gmap_gsnap</a>
- <a href="http://www-huber.embl.de/users/anders/HTSeq" target="_blank">htseq</a>
- <a href="http://i.cs.hku.hk/~alse/hkubrg/projects/idba_ud/index.html" target="_blank">idba-ud</a>
- <a href="https://www.mdc-berlin.de/8551903/en/research/research_teams/systems_biology_of_gene_regulatory_elements/projects/miRDeep" target="_blank">miRDeep2</a>
- <a href="http://i.cs.hku.hk/~alse/hkubrg/projects/idba_ud/index.html" target="_blank">picard</a>
- <a href="https://github.com/pysam-developers” target="_blank">pysam</a>
- <a href="http://qiime.org" target="_blank">qiime</a>
- <a href="http://bioinformatics.psb.ugent.be/software/details/Randfold" target="_blank">randfold</a>
- <a href="http://code.google.com/p/rna-star" target="_blank">rnsatar</a>
- <a href="http://samtools.sourceforge.net" target="_blank">samtools</a>
- <a href="http://soap.genomics.org.cn/soapdenovo.html" target="_blank">soapdenovo</a>
- <a href="http://soap.genomics.org.cn/soapsnp.html" target="_blank">soapsnp</a>
- <a href="http://bioinf.spbau.ru/en/spades" target="_blank">spades</a>
- <a href="squid http://selab.janelia.org/software.html" target="_blank">squid</a>
- <a href="http://tophat.cbcb.umd.ed" target="_blank">tophat</a>
- <a href="http://www.usadellab.org/cms/?page=trimmomatic" target="_blank">trimmomatic</a>
- <a href="http://trinityrnaseq.sourceforge.net" target="_blank">trinity</a>
- <a href="http://www.ebi.ac.uk/~zerbino/velvet/" target="_blank">velvet</a>
- <a href="http://www.tbi.univie.ac.at/~ronny/RNA/index.html" target="_blank">viennaRNA</a>
</description>


## Requirements

To build/install this roll you must have root access to a Rocks development
machine (e.g., a frontend or development appliance).

If your Rocks development machine does *not* have Internet access you must
download the appropriate biotools source file(s) using a machine that does have
Internet access and copy them into the `src/<package>` directories on your Rocks
development machine.


## Dependencies


rolls: cmake,intel (for access to the mkl libraries),math,scipy

## Building

To build the biotools-roll, execute these instructions on a Rocks development
machine (e.g., a frontend or development appliance):

```shell
% make default 2>&1 | tee build.log
% grep "RPM build error" build.log
```

If nothing is returned from the grep command then the roll should have been
created as... `biotools-*.iso`. If you built the roll on a Rocks frontend then
proceed to the installation step. If you built the roll on a Rocks development
appliance you need to copy the roll to your Rocks frontend before continuing
with installation.

This roll source supports building with different compilers and for different
network fabrics and mpi flavors.  By default, it builds using the gnu compilers
for openmpi ethernet.  To build for a different configuration, use the
`ROLLCOMPILER`, `ROLLMPI` and `ROLLNETWORK` make variables, e.g.,

```shell
make ROLLCOMPILER=intel ROLLMPI=mvapich2 ROLLNETWORK=ib 
```
The build process currently supports one or more of the values "intel", "pgi",
and "gnu" for the `ROLLCOMPILER` variable, defaulting to "gnu".  It supports
`ROLLMPI` values "openmpi", "mpich2", and "mvapich2", defaulting to "openmpi".
It uses any `ROLLNETWORK` variable value(s) to load appropriate mpi modules,
assuming that there are modules named `$(ROLLMPI)_$(ROLLNETWORK)` available
(e.g., `openmpi_ib`, `mpich2_mx`, etc.).

If the `ROLLCOMPILER`, `ROLLNETWORK` and/or `ROLLMPI` variables are specified,
their values are incorporated into the names of the produced roll and rpms, e.g.,

```shell
make ROLLCOMPILER=intel ROLLMPI=mvapich2 ROLLNETWORK=ib
```
produces a roll with a name that begins "`biotools_intel_mvapich2_ib`"; it
contains and installs similarly-named rpms.


## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll beast
% cd /export/rocks/install
% rocks create distro
% rocks run roll beast | bash
```

In addition to the software itself, the roll installs biotools environment
module files in:

```shell
/opt/modulefiles/applications/.(compiler)/biotools.
```


## Testing

The biotools-roll includes a test script which can be run to verify proper
installation of the biotools-roll documentation, binaries and module files. To
run the test scripts execute the following command(s):

```shell
% /root/rolltests/biotools.t 
```
