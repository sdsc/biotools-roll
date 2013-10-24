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
  'velvet','bowtie2','cufflinks','trinity','fastqc','fastx','SOAPsnp','spades',
   'gmap-gsnap','biopython'
);
my $isInstalled = -d '/opt/biotools';
my $output;
my $TESTFILE = 'tmpbiotools';

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

$packageHome = '/opt/biotools/cufflinks';
SKIP: {
  skip 'cufflinks not installed', 1 if ! -d $packageHome;
  `mkdir -p $TESTFILE.dir`;
  $output=`cd $TESTFILE.dir; /opt/biotools/cufflinks/bin/cufflinks /opt/biotools/cufflinks/test_data.sam 2>&1`;
  ok($output =~ /Default Mean: 200/, 'cufflinks works');
}

$packageHome = '/opt/biotools/trinity';
SKIP: {
  skip 'trinity not installed', 1 if ! -d $packageHome;
  `mkdir -p $TESTFILE.dir`;
 $out=`cd $TESTFILE.dir;export PATH=/opt/biotools/trinity/bin:\$PATH;cd $TESTFILE.dir; cp /opt/biotools/trinity/sample_data/test_Trinity_Assembly/*.gz .;/opt/biotools/trinity/sample_data/test_Trinity_Assembly/runMe.sh 2>&1`;
  ok($out =~ /All commands completed successfully. :-\)/, 'trinity works');
}

$packageHome = '/opt/biotools/fastqc';
SKIP: {
  skip 'fastax not installed', 1 if ! -d $packageHome;
  `/bin/ls /opt/biotools/fastqc/fastqc 2>&1`;
  ok($? == 0, 'fastqc script installed');
}


$packageHome = '/opt/biotools/fastx';
SKIP: {
  skip 'fastx not installed', 1 if ! -d $packageHome;
  $out=`/opt/biotools/fastx/bin/seqalign_test 2>&1`;
  ok($out =~ /A(AGGTTT)CCC/, 'fastx works');
}

$packageHome = '/opt/biotools/gmap_gsnap';
SKIP: {
  skip 'gmap_gsnap not installed', 1 if ! -d $packageHome;
  $out=`$packageHome/bin/gmap -A -g $packageHome/tests/ss.chr17test $packageHome/tests/ss.her2 2>&1`;
  ok($out =~ /Trimmed coverage: 100.0 (trimmed length: 4624 bp, trimmed region: 1..4624)/, 'gmap-gsnap works');
}

$packageHome = '/opt/biotools/velvet';
SKIP: {
  skip 'velvet not installed', 1 if ! -d $packageHome;
  $out=`mkdir .tmp.$$; cd .tmp.$$ export PATH=/opt/biotools/velvet/bin:\$PATH;\$packageHome/testdata/run-tests.sh 2>&1;rm -rf .tmp.$$`;
  ok($out =~ /passed all 5 tests/, 'velvet works');
}

$packageHome = '/opt/biotools/SOAPsnp';
SKIP: {
  skip 'SOAPsnp not installed', 1 if ! -d $packageHome;
  $out=`/opt/biotools/SOAPsnp/bin/soapsnp 2>&1`;
  ok($out =~ /Compulsory Parameters:/, 'SOAPsnp executable works');
}

$packageHome = '/opt/biotools/picard';
SKIP: {
  skip 'picard not installed', 1 if ! -d $packageHome;
  $out=`java -jar $packageHome/FastqToSam.jar --help 2>&1`;
  ok($out =~ /Compulsory Parameters:/, 'picard works');
}

$packageHome = '/opt/biotools/tophat';
SKIP: {
  skip 'tophat not installed', 1 if ! -d $packageHome;
  $out=`$packageHome/tophat --help 2>&1`;
  ok($out =~ /TopHat maps short sequences from spliced transcripts to whole genomes./, 'tophat executable works');
}

$packageHome = '/opt/biotools/spades';
SKIP: {
  skip 'spades not installed', 1 if ! -d $packageHome;
  $out=`$packageHome/bin/spades.py --test 2>&1`;
  ok($out =~ /======= SPAdes pipeline finished./, 'spades executable works');
}


$packageHome = '/opt/biotools/biopython';
SKIP: {
  skip 'biopython not installed', 1 if ! -d $packageHome;
  $out=`mkdir Tests; cp -r $packageHome/Tests/* Tests;module load scipy; module load intel; export PYTHONPATH=/opt/biotools/biopython/lib64/python2.6/site-packages:\$PYTHONPATH;python Tests/test.py 2>&1`;
  $count=system("echo \$out|grep -c ' ok' >& /dev/null");
  ok($count == 256,'biopython works');
  `rm -rf Tests`;
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
`rm -fr $TESTFILE*`;
