# SDSC "biotools" roll

## Overview

This roll bundles a collection of Biology packages: bamtools bedtools biopython biotools-modules bismark blast blat bowtie bowtie2 bwa bx-python cufflinks dendropy edena fastqc fastx GenomeAnalysisTK gmap_gsnap htseq idba-ud linux.mk Makefile matt miRDeep2 miso picard plink pysam qiime randfold roll-test samtools soapdenovo SOAPsnp spades squid tophat trimmomatic trinity velvet ViennaRNA

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
- <a href="http://samtools.sourceforge.net" target="_blank">samtools</a> provide various utilities for manipulating alignments in the SAM format, including sorting, merging, indexing and generating alignments in a per-position format
- <a href="http://soap.genomics.org.cn/soapdenovo.html" target="_blank">soapdenovo</a> is a novel short-read assembly method that can build a de novo draft assembly for the human-sized genomes
- <a href="http://soap.genomics.org.cn/soapsnp.html" target="_blank">soapsnp</a> is a resequencing utility that can assemble consensus sequence for the genome of a newly sequenced individual based on the alignment of the raw sequencing reads on the known reference
- <a href="http://bioinf.spbau.ru/en/spades" target="_blank">spades</a> St. Petersburg genome assembler is intended for both standard isolates and single-cell MDA bacteria assemblies
- <a href="squid http://selab.janelia.org/software.html" target="_blank">squid</a> is a library of C functions and utility programs for sequence analysis
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
