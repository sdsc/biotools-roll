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
   'gmap_gsnap','biopython','plink','bismark','bamtools','htseq','rnastar',
   'trimmomatic','blast','dendropy','qiime','bx-python','pysam','randfold',
   'squid','ViennaRNA','miRDeep2'
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
  skip 'GenomeAnalysisTK not installed', 1 if ! -d $packageHome;
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
  `$packageHome/bin/SOAPdenovo-63mer pregraph -K 31 -s SRR000046.config -o SRR000046 2>&1`;
  ok(-f './SRR000046.preArc', 'soapdenovo pregraph works');
  `/bin/rm SRR000046*`;
}

$packageHome = '/opt/biotools/cufflinks';
SKIP: {
  skip 'cufflinks not installed', 1 if ! -d $packageHome;
  `mkdir -p $TESTFILE.dir`;
  $output=`cd $TESTFILE.dir; export LD_LIBRARY_PATH=/opt/boost/gnu/lib:\$LD_LIBRARY_PATH;/opt/biotools/cufflinks/bin/cufflinks /opt/biotools/cufflinks/test_data.sam 2>&1`;
  ok($output =~ /Default Mean: 200/, 'cufflinks works');
  `rm -rf $TESTFILE.dir`;
}

$packageHome = '/opt/biotools/trinity';
SKIP: {
  skip 'trinity not installed', 1 if ! -d $packageHome;
  `mkdir -p $TESTFILE.dir`;
 $out=`cd $TESTFILE.dir;. /etc/profile.d/modules.sh;module load biotools;cp /opt/biotools/trinity/sample_data/test_Trinity_Assembly/*.gz .;/opt/biotools/trinity/sample_data/test_Trinity_Assembly/runMe.sh 2>&1`;
  ok($out =~ /All commands completed successfully. :-\)/, 'trinity works');
  `rm -rf $TESTFILE.dir`;
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
  ok($out =~ /Trimmed coverage: 100.0 \(trimmed length: 4624 bp, trimmed region: 1..4624\)/, 'gmap_gsnap works');
}

$packageHome = '/opt/biotools/velvet';
SKIP: {
  skip 'velvet not installed', 1 if ! -d $packageHome;
  `mkdir -p $TESTFILE.dir`;
  $out=`cd $TESTFILE.dir; . /etc/profile.d/modules.sh; module load biotools;$packageHome/testdata/run-tests.sh 2>&1`;
  ok($out =~ /passed all 5 tests/, 'velvet works');
  `rm -rf $TESTFILE.dir`;
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
  ok($out =~ /Extracts read sequences and qualities from the input fastq file/, 'picard works');
}

$packageHome = '/opt/biotools/tophat';
SKIP: {
  skip 'tophat not installed', 1 if ! -d $packageHome;
  $out=`$packageHome/bin/tophat --help 2>&1`;
  ok($out =~ /TopHat maps short sequences from spliced transcripts to whole genomes./, 'tophat executable works');
}

$packageHome = '/opt/biotools/spades';
SKIP: {
  skip 'spades not installed', 1 if ! -d $packageHome;
  $out=`python $packageHome/bin/spades.py --test 2>&1`;
  ok($out =~ /======= SPAdes pipeline finished./, 'spades executable works');
  `rm -rf spades_test`;
}


$packageHome = '/opt/biotools/biopython';
SKIP: {
  skip 'biopython not installed', 1 if ! -d $packageHome;
  `mkdir Tests`;
  `cp -r $packageHome/Tests/* Tests`;
   $out=`. /etc/profile.d/modules.sh; module load intel; module load biotools;module load scipy;python Tests/test.py 2>&1`;
  @output = split(/\n/,$out);
  $count = 0;
  for $line (@output) {
    if ( $line =~ / ok/) {
       $count +=1;
    }
  }
  `rm -rf Tests`; ok($count >= 181,'biopython works'); }

$packageHome = '/opt/biotools/dendropy';
SKIP: {
   skip 'dendropy not installed', 1 if ! -d $packageHome;
   $output=`module load scipy biotools;python $packageHome/test/test_popgenstat.py 2>&1`;
   ok($output =~ /OK/, 'dendropy works');
}
  
$packageHome = '/opt/biotools/plink';
SKIP: {
  skip 'plink not installed', 1 if ! -d $packageHome;
  `mkdir -p $TESTFILE.dir`;
  `cp $packageHome/examples/* $TESTFILE.dir`;
  $output = `. /etc/profile.d/modules.sh;module load biotools;cd $TESTFILE.dir; plink --file hapmap1 2>&1`;
  ok($output =~ /After frequency and genotyping pruning, there are 83534 SNPs/, 'plink works');
  `rm -rf $TESTFILE.dir`;
}

$packageHome = '/opt/biotools/bismark';
SKIP: {
  skip 'bismark not installed', 1 if ! -d $packageHome;
  $output = `. /etc/profile.d/modules.sh;module load biotools;bismark 2>&1`;
  ok($output =~ /USAGE: bismark [options] <genome_folder> {-1 <mates1> -2 <mates2> | <singles>}/, 'bismark works');
}

$packageHome = '/opt/biotools/bamtools';

SKIP: {
  skip 'bamtools not installed', 1 if ! -d $packageHome;
  `mkdir $TESTFILE.dir`;
  `cp $packageHome/examples/* $TESTFILE.dir`;
  `. /etc/profile.d/modules.sh;module load biotools;cd $TESTFILE.dir;g++ -o test -I$packageHome/include/bamtools test.cc -L$packageHome/lib/bamtools -lbamtools>&1`;
  $output=`cd $TESTFILE.dir;. /etc/profile.d/modules.sh; module load biotools; ./test test.bam`;
  ok($output =~ /Qualities ;44999;499<8<8<<<8<<><<<<><7<;<<<>><</, 'bamtools works');
   `rm -rf $TESTFILE*`;
}

#$packageHome = '/opt/biotools/bsseeker';
#
#SKIP: {
#  skip 'bseeker not installed', 1 if ! -d $packageHome;
#  $output=`. /etc/profile.d/modules.sh;module load biotools;python $packageHome/BS_Seeker.py 2> /dev/null`;
#  ok($output =~ /Bowtie path:\/opt\/biotools\/bowtie\//, 'bsseeker works');
#}


$packageHome = '/opt/biotools/htseq';
SKIP: {
  skip 'htseq not installed', 1 if ! -d $packageHome;
  `mkdir $TESTFILE.dir`;
  open(OUT, '>in');
  print OUT <<END;
import HTSeq
END
  close(OUT);
  `.  /etc/profile.d/modules.sh;module load intel; module load biotools; module load scipy;mv in $TESTFILE.dir; cd $TESTFILE.dir;python in; echo $? > .o`;
  ok(`grep -c 0 $TESTFILE.dir/.o` == 1, 'htseq works');
  `rm -rf $TESTFILE*`;
}

$packageHome = '/opt/biotools/rnastar';
SKIP: {
  skip 'rnastar not installed', 1 if ! -d $packageHome;
  ok( -X "$packageHome/bin/STAR", 'rnastar executable exists');
}

$packageHome = '/opt/biotools/trimmomatic';

SKIP: {
  skip 'trimmomatic not installed', 1 if ! -d $packageHome;
  $output=`. /etc/profile.d/modules.sh;module load biotools; java org.usadellab.trimmomatic.TrimmomaticPE 2>&1`;
  ok($output =~ /Usage: TrimmomaticPE/, 'trimmomatic  works');
}


$packageHome = '/opt/biotools/blast';
SKIP: {
  skip 'blast not installed', 1 if ! -d $packageHome;
  `mkdir $TESTFILE.dir`;
  open(OUT, ">$TESTFILE.dir/$TESTFILE.in");
  print OUT <<END;
>
AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC
TTCTGAACTGGTTACCTGCCGTGAGTAAATTAAAATTTTATTGACTTAGGTCACTAAATACTTTAACCAA
TATAGGCATAGCGCACAGACAGATAAAAATTACAGAGTACACAACATCCATGAAACGCATTAGCACCACC
ATTACCACCACCATCACCATTACCACAGGTAACGGTGCGGGCTGACGCGTACAGGAAACACAGAAAAAAG
CCCGCACCTGACAGTGCGGGCTTTTTTTTTCGACCAAAGGTAACGAGGTAACAACCATGCGAGTGTTGAA
GTTCGGCGGTACATCAGTGGCAAATGCAGAACGTTTTCTGCGTGTTGCCGATATTCTGGAAAGCAATGCC
AGGCAGGGGCAGGTGGCCACCGTCCTCTCTGCCCCCGCCAAAATCACCAACCACCTGGTGGCGATGATTG
AAAAAACCATTAGCGGCCAGGATGCTTTACCCAATATCAGCGATGCCGAACGTATTTTTGCCGAACTTTT
END
  close(OUT);
   open(OUT, ">$TESTFILE.sh");
print OUT <<END;
. /etc/profile.d/modules.sh
module load intel biotools
cd $TESTFILE.dir
wget ftp://ftp.ncbi.nlm.nih.gov/blast/db/FASTA/drosoph.nt.gz
gunzip drosoph.nt.gz
makeblastdb -dbtype nucl -in *.nt 
blastn -db *.nt  -query $TESTFILE.in -task blastn -out out
END
close(OUT);
 `bash $TESTFILE.sh 2>&1`;
  open(OUT, "<$TESTFILE.dir/out");
  @output=<OUT>;
  close(OUT);
  ok(grep(/Score = 33.7 bits \(36\),  Expect = 4.5/,@output) gt 0, 'blast works');
  `rm -rf $TESTFILE*`;
}

my $packageHome = '/opt/biotools/qiime';
SKIP: {
  skip 'qimme not installed', 1 if ! -d $packageHome;
  `mkdir $TESTFILE.dir`;
# $out=`cd $TESTFILE.dir; . /etc/profile.d/modules.sh; module load biotools python ; python $packageHome/tests/all_tests.py 2>&1`;
 `cd $TESTFILE.dir; . /etc/profile.d/modules.sh; module load biotools python ; python $packageHome/tests/all_tests.py >& ../out`;
  $out=`cat out`;
  @output = split(/\n/,$out);
  $count = 0;
  for $line (@output) {
    if ( $line =~ / ok/) {
       $count +=1;
    }
    if ( $line =~ /^OK/) {
       $count +=1;
    }
    if ( $line =~ /^ok/) {
       $count +=1;
    }
  }
  ok($count >= 676,'qiime works');
  `rm -rf $TESTFILE*`;
}

$packageHome = '/opt/biotools/bx-python';
SKIP: {
  skip 'bx-python not installed', 1 if ! -d $packageHome;
  `mkdir -p $TESTFILE.dir`;
   open(OUT, ">$TESTFILE.sh");
   print OUT <<END;
. /etc/profile.d/modules.sh
module load intel biotools scipy
cd $TESTFILE.dir
wget http://mirror.vcu.edu/vcu/encode/Bigwig/GSM595923_UW.Fetal_Brain.ChromatinAccessibility.H-23266.DS14718.bigWig
python in
END
   close(OUT);
   open(OUT, ">in");
   print OUT <<END;
from bx.intervals.io import GenomicIntervalReader
from bx.bbi.bigwig_file import BigWigFile
import numpy as np
bw = BigWigFile(open('GSM595923_UW.Fetal_Brain.ChromatinAccessibility.H-23266.DS14718.bigWig'))
mySummary = bw.query("chr1", 10000, 10500, 1)
myInterval = bw.get("chr1", 10000, 10500)
myArrayInterval = bw.get_as_array("chr1", 10000, 10500)
print mySummary
print myInterval
END
   close(OUT);
   `mv in $TESTFILE.dir`;
   $out=`bash $TESTFILE.sh 2>&1`;
   ok($out =~ /'std_dev': 9.310512767924612/, 'bx-python  works');
   `rm -rf $TESTFILE*`;
}

$packageHome = '/opt/biotools/pysam';
SKIP: {
  skip 'pysam not installed', 1 if ! -d $packageHome;
  `mkdir -p $TESTFILE.dir`;
   open(OUT, ">$TESTFILE.sh");
   print OUT <<END;
. /etc/profile.d/modules.sh
module load intel biotools scipy
cd $TESTFILE.dir
cp -r $packageHome/tests/* .
python compile_test.py
END
   close(OUT);
   $out=`bash $TESTFILE.sh 2>&1`;
   ok($out =~ /OK/, 'pysam  works');
  `rm -rf $TESTFILE*`;
}

$packageHome = '/opt/biotools/randfold';
SKIP: {
  skip 'randfold not installed', 1 if ! -d $packageHome;
   $out=`. /etc/profile.d/modules.sh; module load biotools; randfold -d $packageHome/tests/let7.tfa 999  2>&1`;
   ok($out =~ /cel-let-7	-42.90	0.001000/, 'randfold  works');
}

$packageHome = '/opt/biotools/squid';
SKIP: {
  skip 'squid not installed', 1 if ! -d $packageHome;
  `mkdir -p $TESTFILE.dir`;
   open(OUT, ">$TESTFILE.sh");
   print OUT <<END;
. /etc/profile.d/modules.sh
module load biotools
cd $TESTFILE.dir
cp -r $packageHome/tests/* .
XBASE='x-base-afetch x-base-alistat x-base-seqstat x-base-sfetch x-base-shuffle x-base-sindex x-base-sreformat'
BUGLIST=bug-1-sfetch-paths
for xprog in \$XBASE; do
    ./\$xprog;\
done
for bugprog in \$BUGLIST; do\
    ./\$bugprog;
done
END
   close(OUT);
   $out=`bash $TESTFILE.sh 2>&1`;
   @output = split(/\n/,$out);
   $count = 0;
   for $line (@output) {
    if ( $line =~ /ok/) {
       $count +=1;
    }
  }
  ok($count == 8,'squid works');
  `rm -rf $TESTFILE*`;
}

$packageHome = '/opt/biotools/ViennaRNA';
SKIP: {
  skip 'ViennaRNA not installed', 1 if ! -d $packageHome;
  `mkdir -p $TESTFILE.dir`;
   open(OUT, ">$TESTFILE.sh");
   print OUT <<END;
. /etc/profile.d/modules.sh
module load biotools
cd $TESTFILE.dir
cp -r $packageHome/tests/* .
perl test.pl
END
   close(OUT);
   $out=`bash $TESTFILE.sh 2>&1`;
   @output = split(/\n/,$out);
   $count = 0;
   for $line (@output) {
    if ( $line =~ /ok/) {
       $count +=1;
    }
  }
  ok($count == 24,'ViennaRNA works');
  `rm -rf $TESTFILE*`;

$packageHome = '/opt/biotools/miRDeep2';
SKIP: {
  skip 'miRDeep2 not installed', 1 if ! -d $packageHome;
  `mkdir -p $TESTFILE.dir`;
   open(OUT, ">$TESTFILE.sh");
   print OUT <<END;
. /etc/profile.d/modules.sh
module load biotools
cd $TESTFILE.dir
cp -r $packageHome/tests/* .
bowtie-build cel_cluster.fa cel_cluster
mapper.pl reads.fa -c -j -k TCGTATGCCGTCTTCTGCTTGT  -l 18 -m -p cel_cluster -s reads_collapsed.fa -t r
eads_collapsed_vs_genome.arf -v
quantifier.pl -p precursors_ref_this_species.fa -m mature_ref_this_species.fa -r reads_collapsed.fa -t cel -y 16_19
miRDeep2.pl reads_collapsed.fa cel_cluster.fa reads_collapsed_vs_genome.arf mature_ref_this_species.fa mature_ref_other_species.fa precursors_ref_this_species.fa -t C.elegans 2> report.log
END
   close(OUT);
   `bash $TESTFILE.sh >& /dev/null`;
   ok(`grep -c "cel-miR-41      87.00   cel-mir-41      87.00   87.00   509.68" $TESTFILE.dir/miRNAs_expressed_all_samples_16_19.csv` == 1, 'miRDeep2 works');
 `rm -rf $TESTFILE*`;

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
