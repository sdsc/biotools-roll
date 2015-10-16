<<<<<<< HEAD
# SDSC "biotools" roll

## Overview

This roll bundles a collection of Biology packages: bamtools bedtools biopython bismark blast blat bowtie bowtie2 bwa bx-python cufflinks dendropy edena fastqc fastx GenomeAnalysisTK gmap_gsnap htseq idba-ud matt miRDeep2 miso picard plink pysam qiime randfold samtools soapdenovo SOAPsnp spades squid tophat trimmomatic trinity velvet ViennaRNA

For more information about the various biology packages included in the biotools
roll please visit their official web pages:

- <a href="https://github.com/pezmaster31/bamtools" target="_blank">bamtools</a> provides both a programmer's API and an end-user's toolkit for handling BAM files
- <a href="https://github.com/arq5x/bedtools2" target="_blank">bedtools</a> is a toolset for genome arithmetic
- <a href="http://biopython.org" target="_blank">biopython</a> is a set tools for biological computation.
- <a href="http://blast.ncbi.nlm.nih.gov/Blast.cgi" target="_blank">blast</a> finds regions of similarity between biological sequences.
- <a href="https://pypi.python.org/pypi/bx-python" target="_blank">bx-python</a> consists of tools for manipulating biological data, particularly multiple sequence alignments
- <a href="http://genome.ucsc.edu/goldenPath/help/blatSpec.html" target="_blank">blat</a> produces two major classes of alignments: at the DNA level between two sequences that are of 95% or greater identity, but which may include large inserts and at the protein or translated DNA level between sequences that are of 80% or greater identity and may also include large inserts
- <a href="http://bowtie-bio.sourceforge.net" target="_blank">bowtie</a> is a tool for aligning sequenc
ing reads to long reference sequences 
- <a href="http://bowtie-bio.sourceforge.net/bowtie2" target="_blank">bowtie2</a> is a tool for aligning sequencing reads to long reference sequences and has more features then bowtie 1.
- <a href="http://bio-bwa.sourceforge.net" target="_blank">bwa</a> as a software package for mapping low-divergent sequences against a large reference genome
- <a href="http://cufflinks.cbcb.umd.edu" target="_blank">cufflinks</a> assembles transcripts, estimates their abundances, and tests for differential expression and regulation in RNA-Seq samples
- <a href="http://pythonhosted.org/DendroPy" target="_blank">dendropy</a> is a Python library for the simulation, processing, and manipulation of phylogenetic trees and character matrices, and supports the reading and writing of phylogenetic data in a range of formats
- <a href="http://www.genomic.ch/edena.php" target="_blank">edena</a> is a de novo short reads assembler
- <a href="http://www.bioinformatics.babraham.ac.uk/projects/fastqc" target="_blank">fastqc</a> is a quality control tool for high throughput sequence data
- <a href="http://hannonlab.cshl.edu/fastx_toolkit" target="_blank">fastx</a> is a collection of command line tools for Short-Reads FASTA/FASTQ files preprocessing
- <a href="http://www.broadinstitute.org/gatk" target="_blank">GenomeAnalysisTK</a> s a software package developed to analyse next-generation resequencing data
- <a href="http://research-pub.gene.com/gmap" target="_blank">gmap_gsnap</a> gmap is a genomic mapping and alignment program for mRNA and EST Sequences, and GSNAP: Genomic Short-read Nucleotide Alignment Program
- <a href="http://www-huber.embl.de/users/anders/HTSeq" target="_blank">htseq</a> is a Python package that provides infrastructure to process data from high-throughput sequencing assays
- <a href="http://i.cs.hku.hk/~alse/hkubrg/projects/idba_ud/index.html" target="_blank">idba-ud</a> s a iterative De Bruijn Graph De Novo Assembler for Short Reads Sequencing data with Highly Uneven Sequencing Depth
- <a href="https://http://matt.cs.tufts.edu/" target="_blank">matt</a> is a multiple protein structure alignment program
- <a href="https://www.mdc-berlin.de/8551903/en/research/research_teams/systems_biology_of_gene_regulatory_elements/projects/miRDeep" target="_blank">miRDeep2</a> is a tool which discovers microRNA genes by analyzing sequenced RNAs
- <a href="https://http://genes.mit.edu/burgelab/miso/software.html" target="_blank">miso</a>uses a statistical model to estimate the expression of alternatively spliced exons and isoforms and to assesses confidence in these estimates. 
- <a href="http://http://picard.sourceforge.net" target="_blank">picard</a> comprises Java-based command-line utilities that manipulate SAM files, and a Java API (HTSJDK) for creating new programs that read and write SAM files
- <a href="https://www.cog-genomics.org/plink2/dev="_blank">plink</a>  is a toolset for genome-wide association studies (GWAS) and research in population genetics
- <a href="https://github.com/pysam-developers" target="_blank">pysam</a> is a python module for reading and manipulating Samfiles
- <a href="http://qiime.org" target="_blank">qiime</a> . QIIME ( Quantitative Insights Into Microbial Ecology ) is a package for comparison and analysis of microbial communities, primarily based on high-throughput amplicon sequencing data (such as SSU rRNA) generated on a variety of platforms, but also supporting analysis of other types of data (such as shotgun metagenomic data)
- <a href="http://bioinformatics.psb.ugent.be/software/details/Randfold" target="_blank">randfold</a> computes the probability that, for a given RNA sequence, the Minimum Free Energy (MFE) of the secondary structure is different from a distribution of MFE computed with random sequences
- <a href="http://rseqc.sourceforge.net" target="_blank">rseqc</a> provides a number of useful modules that can comprehensively evaluate high throughput sequence data especially RNA-seq data
- <a href="http://samtools.sourceforge.net" target="_blank">samtools</a> provide various utilities for manipulating alignments in the SAM format, including sorting, merging, indexing and generating alignments in a per-position format
- <a href="http://soap.genomics.org.cn/soapdenovo.html" target="_blank">soapdenovo</a> is a novel short-read assembly method that can build a de novo draft assembly for the human-sized genomes
- <a href="http://soap.genomics.org.cn/soapsnp.html" target="_blank">soapsnp</a> is a resequencing utility that can assemble consensus sequence for the genome of a newly sequenced individual based on the alignment of the raw sequencing reads on the known reference
- <a href="http://bioinf.spbau.ru/en/spades" target="_blank">spades</a> St. Petersburg genome assembler is intended for both standard isolates and single-cell MDA bacteria assemblies
- <a href="squid http://selab.janelia.org/software.html" target="_blank">squid</a> is a library of C functions and utility programs for sequence analysis
- <a href="stacks http://http://creskolab.uoregon.edu/stacks" target="_blank">stacks</a> is aoftware pipeline for building loci from short-read sequences, such as those generated on the Illumina platform.
- <a href="http://ccb.jhu.edu/software/tophat/index.shtml" target="_blank">tophat</a> is a fast splice junction mapper for RNA-Seq reads
- <a href="http://www.usadellab.org/cms/?page=trimmomatic" target="_blank">trimmomatic</a> is used to quality trim and adapter clip NGS data
- <a href="http://trinityrnaseq.github.io" target="_blank">trinity</a> represents a novel method for the efficient and robust de novo reconstruction of transcriptomes from RNA-seq data
- <a href="http://vcftools.github.io" target="_blank">vcftools</a> is a program package designed for working with VCF files, such as those generated by the 1000 Genomes Project
- <a href="http://www.ebi.ac.uk/~zerbino/velvet/" target="_blank">velvet</a> is a de novo genomic assembler specially designed for short read sequencing technologies
- <a href="http://www.tbi.univie.ac.at/~ronny/RNA/index.html" target="_blank">viennaRNA</a> consists of a C code library and several stand-alone programs for the prediction and comparison of RNA secondary structures
</description>


## Requirements

To build/install this roll you must have root access to a Rocks development
machine (e.g., a frontend or development appliance).

If your Rocks development machine does *not* have Internet access you must
download the appropriate biotools source file(s) using a machine that does have
Internet access and copy them into the `src/<package>` directories on your Rocks
development machine.


## Dependencies

The sdsc-roll must be installed on the build machine, since the build process
depends on make include files provided by that roll.

The roll sources assume that modulefiles provided by SDSC compiler and python
rolls are available, but it will build without them as long as the environment
variables they provide are otherwise defined.

The build process requires the BOOST, EIGEN, and MKL and python NUMPY and 
SCIPY libraries  libraries and assumes that the modulefiles provided by the SDSC 
boost-roll, math-roll, and mkl-roll (or intel-roll), python-roll and scipy-roll  are available. 
It will build without the modulefiles as long as the environment variables they providet:w

The build process requires cmake and assumes that the cmake modulefile provided
by the SDSC cmake-roll is available.  It will build without the modulefile as
long as the environment variables it provides are otherwise defined.


## Building

To build the biotools-roll, execute this on a Rocks development
machine (e.g., a frontend or development appliance):

```shell
% make 2>&1 | tee build.log
```

A successful build will create the file `biotools-*.disk1.iso`.  If you built
the roll on a Rocks frontend, proceed to the installation step. If you built the
roll on a Rocks development appliance, you need to copy the roll to your Rocks
frontend before continuing with installation.
with installation.
L
This roll source supports building with different compilers.
The `ROLLCOMPILER` make variable can be used to
specify the names of the compiler modulefile to use for building the
software, e.g.,

```shell
make ROLLCOMPILER=intel 2>&1 | tee build.log
```

The build process recognizes "gnu", "intel" or "pgi" as the value for the
`ROLLCOMPILER` variable


## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll biotools
% cd /export/rocks/install
% rocks create distro
% rocks run roll biotools | bash
```

In addition to the software itself, the roll installs biotools environment
module files in:

```shell
/opt/modulefiles/applications
```


## Testing

The biotools-roll includes a test script which can be run to verify proper
installation of the roll documentation, binaries and module files. To
run the test scripts execute the following command(s):

```shell
% /root/rolltests/biotools.t 
```

=======
# SDSC "biotools" roll

## Overview

This roll bundles a collection of Biology packages: bamtools bedtools biopython bismark blast blat bowtie bowtie2 bwa bx-python cufflinks dendropy edena fastqc fastx GenomeAnalysisTK gmap_gsnap htseq idba-ud matt miRDeep2 miso picard plink pysam qiime randfold samtools soapdenovo SOAPsnp spades squid tophat trimmomatic trinity velvet ViennaRNA

For more information about the various biology packages included in the biotools
roll please visit their official web pages:

- <a href="https://github.com/pezmaster31/bamtools" target="_blank">bamtools</a> provides both a programmer's API and an end-user's toolkit for handling BAM files
- <a href="https://github.com/arq5x/bedtools2" target="_blank">bedtools</a> is a toolset for genome arithmetic
- <a href="http://biopython.org" target="_blank">biopython</a> is a set tools for biological computation.
- <a href="http://blast.ncbi.nlm.nih.gov/Blast.cgi" target="_blank">blast</a> finds regions of similarity between biological sequences.
- <a href="https://pypi.python.org/pypi/bx-python" target="_blank">bx-python</a> consists of tools for manipulating biological data, particularly multiple sequence alignments
- <a href="http://genome.ucsc.edu/goldenPath/help/blatSpec.html" target="_blank">blat</a> produces two major classes of alignments: at the DNA level between two sequences that are of 95% or greater identity, but which may include large inserts and at the protein or translated DNA level between sequences that are of 80% or greater identity and may also include large inserts
- <a href="http://bowtie-bio.sourceforge.net" target="_blank">bowtie</a> is a tool for aligning sequenc
ing reads to long reference sequences 
	- <a href="http://bowtie-bio.sourceforge.net/bowtie2" target="_blank">bowtie2</a> is a tool for aligning sequencing reads to long reference sequences and has more features then bowtie 1.
	- <a href="http://bio-bwa.sourceforge.net" target="_blank">bwa</a> as a software package for mapping low-divergent sequences against a large reference genome
	- <a href="http://cufflinks.cbcb.umd.edu" target="_blank">cufflinks</a> assembles transcripts, estimates their abundances, and tests for differential expression and regulation in RNA-Seq samples
	- <a href="http://pythonhosted.org/DendroPy" target="_blank">dendropy</a> is a Python library for the simulation, processing, and manipulation of phylogenetic trees and character matrices, and supports the reading and writing of phylogenetic data in a range of formats
	- <a href="http://www.genomic.ch/edena.php" target="_blank">edena</a> is a de novo short reads assembler
	- <a href="http://www.bioinformatics.babraham.ac.uk/projects/fastqc" target="_blank">fastqc</a> is a quality control tool for high throughput sequence data
	- <a href="http://hannonlab.cshl.edu/fastx_toolkit" target="_blank">fastx</a> is a collection of command line tools for Short-Reads FASTA/FASTQ files preprocessing
	- <a href="http://www.broadinstitute.org/gatk" target="_blank">GenomeAnalysisTK</a> s a software package developed to analyse next-generation resequencing data
	- <a href="http://research-pub.gene.com/gmap" target="_blank">gmap_gsnap</a> gmap is a genomic mapping and alignment program for mRNA and EST Sequences, and GSNAP: Genomic Short-read Nucleotide Alignment Program
	- <a href="http://www-huber.embl.de/users/anders/HTSeq" target="_blank">htseq</a> is a Python package that provides infrastructure to process data from high-throughput sequencing assays
	- <a href="http://i.cs.hku.hk/~alse/hkubrg/projects/idba_ud/index.html" target="_blank">idba-ud</a> s a iterative De Bruijn Graph De Novo Assembler for Short Reads Sequencing data with Highly Uneven Sequencing Depth
	- <a href="https://http://matt.cs.tufts.edu/" target="_blank">matt</a> is a multiple protein structure alignment program
	- <a href="https://www.mdc-berlin.de/8551903/en/research/research_teams/systems_biology_of_gene_regulatory_elements/projects/miRDeep" target="_blank">miRDeep2</a> is a tool which discovers microRNA genes by analyzing sequenced RNAs
	- <a href="https://http://genes.mit.edu/burgelab/miso/software.html" target="_blank">miso</a>uses a statistical model to estimate the expression of alternatively spliced exons and isoforms and to assesses confidence in these estimates. 
- <a href="http://http://picard.sourceforge.net" target="_blank">picard</a> comprises Java-based command-line utilities that manipulate SAM files, and a Java API (HTSJDK) for creating new programs that read and write SAM files
- <a href="https://github.com/pysam-developers" target="_blank">pysam</a> is a python module for reading and manipulating Samfiles
- <a href="http://qiime.org" target="_blank">qiime</a> . QIIME ( Quantitative Insights Into Microbial Ecology ) is a package for comparison and analysis of microbial communities, primarily based on high-throughput amplicon sequencing data (such as SSU rRNA) generated on a variety of platforms, but also supporting analysis of other types of data (such as shotgun metagenomic data)
- <a href="http://bioinformatics.psb.ugent.be/software/details/Randfold" target="_blank">randfold</a> computes the probability that, for a given RNA sequence, the Minimum Free Energy (MFE) of the secondary structure is different from a distribution of MFE computed with random sequences
- <a href="http://rseqc.sourceforge.net" target="_blank">rseqc</a> provides a number of useful modules that can comprehensively evaluate high throughput sequence data especially RNA-seq data
- <a href="http://samtools.sourceforge.net" target="_blank">samtools</a> provide various utilities for manipulating alignments in the SAM format, including sorting, merging, indexing and generating alignments in a per-position format
- <a href="http://soap.genomics.org.cn/soapdenovo.html" target="_blank">soapdenovo</a> is a novel short-read assembly method that can build a de novo draft assembly for the human-sized genomes
- <a href="http://soap.genomics.org.cn/soapsnp.html" target="_blank">soapsnp</a> is a resequencing utility that can assemble consensus sequence for the genome of a newly sequenced individual based on the alignment of the raw sequencing reads on the known reference
- <a href="http://bioinf.spbau.ru/en/spades" target="_blank">spades</a> St. Petersburg genome assembler is intended for both standard isolates and single-cell MDA bacteria assemblies
- <a href="squid http://selab.janelia.org/software.html" target="_blank">squid</a> is a library of C functions and utility programs for sequence analysis
- <a href="stacks http://http://creskolab.uoregon.edu/stacks" target="_blank">stacks</a> is aoftware pipeline for building loci from short-read sequences, such as those generated on the Illumina platform.
- <a href="http://ccb.jhu.edu/software/tophat/index.shtml" target="_blank">tophat</a> is a fast splice junction mapper for RNA-Seq reads
- <a href="http://www.usadellab.org/cms/?page=trimmomatic" target="_blank">trimmomatic</a> is used to quality trim and adapter clip NGS data
- <a href="http://trinityrnaseq.sourceforge.net" target="_blank">trinity</a> represents a novel method for the efficient and robust de novo reconstruction of transcriptomes from RNA-seq data
- <a href="http://www.ebi.ac.uk/~zerbino/velvet/" target="_blank">velvet</a> is a de novo genomic assembler specially designed for short read sequencing technologies
- <a href="http://www.tbi.univie.ac.at/~ronny/RNA/index.html" target="_blank">viennaRNA</a> consists of a C code library and several stand-alone programs for the prediction and comparison of RNA secondary structures
</description>


## Requirements

To build/install this roll you must have root access to a Rocks development
machine (e.g., a frontend or development appliance).

If your Rocks development machine does *not* have Internet access you must
download the appropriate biotools source file(s) using a machine that does have
Internet access and copy them into the `src/<package>` directories on your Rocks
development machine.


## Dependencies

The sdsc-roll must be installed on the build machine, since the build process
depends on make include files provided by that roll.

The roll sources assume that modulefiles provided by SDSC compiler and python
rolls are available, but it will build without them as long as the environment
variables they provide are otherwise defined.

The build process requires the BOOST, EIGEN, and MKL libraries and assumes that
the modulefiles provided by the SDSC boost-roll, math-roll, and intel-roll
are available.  It will build without the modulefiles as long as
the environment variables they provide are otherwise defined.

The build process requires cmake and assumes that the cmake modulefile provided
by the SDSC cmake-roll is available.  It will build without the modulefile as
long as the environment variables it provides are otherwise defined.


## Building

To build the biotools-roll, execute this on a Rocks development
machine (e.g., a frontend or development appliance):

```shell
% make 2>&1 | tee build.log
```

A successful build will create the file `biotools-*.disk1.iso`.  If you built the
roll on a Rocks frontend, proceed to the installation step. If you built the
roll on a Rocks development appliance, you need to copy the roll to your Rocks
frontend before continuing with installation.
with installation.

This roll source supports building with different compilers.
The `ROLLCOMPILER` make variable can be used to
specify the name of compiler modulefiles to use for building the
software, e.g.,

```shell
make ROLLCOMPILER=intel 2>&1 | tee build.log
```

The build process recognizes "gnu", "intel" or "pgi" as the value for the
`ROLLCOMPILER` variable; the default value is "gnu".


## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll biotools
% cd /export/rocks/install
% rocks create distro
% rocks run roll biotools | bash
```

In addition to the software itself, the roll installs biotools environment
module files in:

```shell
/opt/modulefiles/applications/biotools.
```


## Testing

The biotools-roll includes a test script which can be run to verify proper
installation of the roll documentation, binaries and module files. To
run the test scripts execute the following command(s):

```shell
% /root/rolltests/biotools.t 
```
>>>>>>> FETCH_HEAD
