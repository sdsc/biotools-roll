# SDSC "biotools" roll

## Overview

This roll bundles a collection of Biology packages: blat, bowtie, bwa,
GenomeAnalysisTK, samtools, soapdenovo, and velvet. 

For more information about the various biology packages included in the biotools roll please visit their official web pages:

- <a href="http://genome.ucsc.edu/goldenPath/help/blatSpec.html" target="_blank">blat</a>.
- <a href="http://bowtie-bio.sourceforge.net/index.shtml" target="_blank">bowtie</a>.
- <a href="http://bio-bwa.sourceforge.net" target="_blank">bwa</a>.
- <a href="http://beast.bio.ed.ac.uk/Main_Page" target="_blank">GenomeAnalysisTK</a>.
- <a href="http://samtools.sourceforge.net" target="_blank">samtools</a>.
- <a href="http://soap.genomics.org.cn/soapdenovo.html" target="_blank">soapdenovo</a>.
- <a href="http://www.ebi.ac.uk/~zerbino/velvet/" target="_blank">velvet</a>.


## Requirements

To build/install this roll you must have root access to a Rocks development machine (e.g., a frontend or development appliance).

If your Rocks development machine does *not* have Internet access you must download the appropriate R source file(s) using a machine that does have Internet access and copy them into the `src/<package>` directories on your Rocks development machine.


## Dependencies

Unknown at this time.


## Building

To build the biotools-roll, execute these instructions on a Rocks development machine (e.g., a frontend or development appliance):

```shell
% make default 2>&1 | tee build.log
% grep "RPM build error" build.log
```

If nothing is returned from the grep command then the roll should have been created as... `biotools-*.iso`. If you built the roll on a Rocks frontend then proceed to the installation step. If you built the roll on a Rocks development appliance you need to copy the roll to your Rocks frontend before continuing with installation.

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
assuming that there are modules named `$(ROLLMPI)_$(ROLLNETWORK)` available (e.g., `openmpi_ib`, `mpich2_mx`, etc.).

If the `ROLLCOMPILER`, `ROLLNETWORK` and/or `ROLLMPI` variables are specified, their values are incorporated into the names of the produced roll and rpms, e.g.,

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

In addition to the software itself, the roll installs biotools environment module files in:

```shell
/opt/modulefiles/applications/.(compiler)/biotools.
```


## Testing

The biotools-roll includes a test script which can be run to verify proper installation of the biotools-roll documentation, binaries and module files. To run the test scripts execute the following command(s):

```shell
% /root/rolltests/biotools.t 
ok 1 - biotools is installed
ok 2 - biotools test run
ok 3 - biotools module installed
ok 4 - biotools version module installed
ok 5 - biotools version module link created
1..5
```


