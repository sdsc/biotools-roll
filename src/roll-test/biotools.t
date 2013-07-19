#!/usr/bin/perl -w
# biotools roll installation test.  Usage:
# biotools.t [nodetype]
#   where nodetype is one of "Compute", "Dbnode", "Frontend" or "Login"
#   if not specified, the test assumes either Compute or Frontend

use Test::More qw(no_plan);

my $appliance = $#ARGV >= 0 ? $ARGV[0] :
                -d '/export/rocks/install' ? 'Frontend' : 'Compute';
my $installedOnAppliancesPattern = '.';
my @packages = (
  'blat', 'bowtie', 'bwa', 'GenomeAnalysisTK', 'samtools', 'soapdenovo',
  'velvet','bowtie2'
);
my $isInstalled = -d '/opt/biotools';
my $output;

# biotools-common.xml
if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, 'biotools installed');
  foreach my $package(@packages) {
    ok(-d "/opt/biotools/$package", "$package installed");
  }
} else {
  ok(! $isInstalled, 'biotools not installed');
}

my $packageHome = '/opt/biotools/blat';
SKIP: {
  skip 'blat not installed', 1 if ! -d $packageHome;
  `$packageHome/bin/x86_64/blat -verbose=0 $packageHome/test/target.fa  $packageHome/test/query.fa blat.out -minScore=190 >/dev/null 2>&1`;
  `/usr/bin/cmp $packageHome/test/test1.psl blat.out`;
  ok($? == 0, 'blat works');
  `/bin/rm -f blat.out`;
}

$packageHome = '/opt/biotools/bowtie';
SKIP: {
  skip 'bowtie not installed', 1 if ! -d $packageHome;
  $output = `cd $packageHome; bin/bowtie indexes/e_coli reads/e_coli_1000.fq 2>&1`;
  ok($output =~ /Reported 699 alignments/, 'bowtie works');
}

$packageHome = '/opt/biotools/bowtie2';
SKIP: {
  skip 'bowtie2 not installed', 1 if ! -d $packageHome;
  $output = `cd $packageHome/indexes; ../bin/bowtie2 -p 8 -x lambda_virus ../reads/reads_1.fq 2>&1`;
  ok($output =~ /94.04% overall alignment rate/, 'bowtie2 works');
}

$packageHome = '/opt/biotools/bwa';
SKIP: {
  skip 'bwa not installed', 1 if ! -d $packageHome;
  open(OUT, '>mg323.fa');
  print OUT <<END;
>sp|P47565|Y323_MYCGE Uncharacterized protein MG323 OS=Mycoplasma genitalium GN=MG323 PE=4 SV=1
MKRADFCIIGLGRFGMQVAQSLKENNFNLLLIDLDDKKTDTASQQFDYVICCDASNLTAL
EELQIDEFAGVIVGVTNIEASIMICANLRELGQKNIIAKAKNEVHKRVLSTMGIREALIP
EKIVGKNLVIRLIHGLENEIINLGNEIIFIRSAVNNKAFFNKRLEEINFRQNTDANIISI
MRSNKTVVFPLGPNTEIQPGDIITAVCQQKSLNKYLNYINPKTKNKN
END
  close(OUT);
  `$packageHome/bin/bwa index -p mg323 -a is mg323.fa >/dev/null 2>&1`;
  ok(-f 'mg323.amb' && -f 'mg323.ann' && -f 'mg323.bwt' && -f 'mg323.pac' &&
     -f 'mg323.sa', 'bwa index run works');
  `/bin/rm -f mg323.*`;
}

$packageHome = '/opt/biotools/GenomeAnalysisTK';
SKIP: {
  skip 'samtools not installed', 1 if ! -d $packageHome;
  $output = `java -jar $packageHome/GenomeAnalysisTK.jar -R $packageHome/resources/exampleFASTA.fasta  -I $packageHome/resources/exampleBAM.bam -T CountReads`;
  ok($output =~ /33 reads in the traversal/, 'GenomeAnalysisTK works');
}

$packageHome = '/opt/biotools/samtools';
SKIP: {
  skip 'samtools not installed', 1 if ! -d $packageHome;
  `cd $packageHome/examples; ../bin/samtools faidx ex1.fa`;
  $output = `cat $packageHome/examples/ex1.fa.fai`;
  like($output, qr/seq2/, 'samtools index run works');
  `/bin/rm -f $packageHome/examples/ex1.fa.fai`;
}

# Adapted from http://seqanswers.com/wiki/How-to/de_novo_assembly
$packageHome = '/opt/biotools/soapdenovo';
SKIP: {
  skip 'soapdenovo not installed', 1 if ! -d $packageHome;
  print "Downloading soapdenovo test data (takes a minute)\n";
  `/usr/bin/wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR000/SRR000046/SRR000046_1.fastq.gz 2>&1`;
  `/usr/bin/wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR000/SRR000046/SRR000046_2.fastq.gz 2>&1`;
  skip 'unable to retrieve soapdenov test data', 1
    if !-f 'SRR000046_1.fastq.gz' || !-f 'SRR000046_2.fastq.gz';
  `/bin/gunzip SRR000046_1.fastq.gz SRR000046_2.fastq.gz`;
  open(OUT, '>SRR000046.config');
  print OUT <<END;
max_rd_len=36
[LIB]
avg_ins=200
reverse_seq=0
asm_flags=1
rank=1
q1=./SRR000046_1.fastq
q2=./SRR000046_2.fastq
END
  close(OUT);
  `$packageHome/bin/SOAPdenovo-31mer pregraph -K 31 -s SRR000046.config -o SRR000046 2>&1`;
  ok(-f './SRR000046.preArc', 'soapdenovo pregraph works');
  `/bin/rm SRR000046*`;
}

$packageHome = '/opt/biotools/velvet';
SKIP: {
  skip 'velvet not installed', 1 if ! -d $packageHome;
  $output = `cd $packageHome; mkdir test; bin/velveth test 21 -shortPaired testdata/test_reads.fa; bin/velvetg test; rm -rf test 2>&1`;
  ok($output =~ /Final graph has 16 nodes and n50 of 24184, max 44966, total 100080, using 0\/142858 reads/, 'velvet works');
}

SKIP: {

  skip 'biotools not installed', 3 if ! $isInstalled;
  skip 'modules not installed', 3 if ! -f '/etc/profile.d/modules.sh';
  `/bin/ls /opt/modulefiles/applications/biotools/[0-9]* 2>&1`;
  ok($? == 0, 'biotools module installed');
  `/bin/ls /opt/modulefiles/applications/biotools/.version.[0-9]* 2>&1`;
  ok($? == 0, 'biotools version module installed');
  ok(-l '/opt/modulefiles/applications/biotools/.version',
     'biotools version module link created');

}
