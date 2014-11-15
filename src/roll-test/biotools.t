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
  'bamtools', 'bedtools', 'biopython', 'bismark', 'blast', 'blat', 'bowtie',
  'bowtie2', 'bwa', 'bx-python', 'cufflinks', 'dendropy', 'edena', 'fastqc',
  'fastx', 'GenomeAnalysisTK', 'gmap_gsnap', 'htseq', 'idba-ud', 'matt',
  'miRDeep2', 'miso', 'picard', 'plink', 'pysam', 'qiime', 'randfold',
  'samtools', 'soapdenovo', 'SOAPsnp', 'spades', 'squid', 'tophat',
  'trimmomatic', 'trinity', 'velvet', 'ViennaRNA','stacks','rseqc'
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

$packageHome = '/opt/biotools/bamtools';
SKIP: {
  skip 'bamtools not installed', 1 if ! -d $packageHome;
  `mkdir $TESTFILE.dir`;
  `cp $packageHome/examples/* $TESTFILE.dir`;
  $output = `module load biotools; cd $TESTFILE.dir; g++ -o test -I$packageHome/include/bamtools test.cc -L$packageHome/lib/bamtools -lbamtools; ./test test.bam 2>&1`;
  like($output, qr/Qualities ;44999;499<8<8<<<8<<><<<<><7<;<<<>><</, 'bamtools works');
  `rm -rf $TESTFILE*`;
}

$packageHome = '/opt/biotools/bedtools';
SKIP: {
  skip 'bedtools not installed', 1 if ! -d $packageHome;
  my @exes = ('annotateBed','bedToBam','complementBed','genomeCoverageBed','mapBed','nucBed','slopBed','windowBed','bamToBed','bedToIgv','coverageBed','getOverlap','maskFastaFromBed','pairToBed','sortBed','windowMaker','bamToFastq','expandCols','groupBy','mergeBed','pairToPair','subtractBed','bed12ToBed6','closestBed','fastaFromBed','intersectBed','multiBamCov','randomBed','tagBam','bedpeToBam','clusterBed','flankBed','linksBed','shuffleBed');
  foreach $exe(@exes) {
    `module load biotools; $exe --help >> $TESTFILE 2>&1`;
  }
  @exes = ('unionBedGraphs','multiIntersectBed');
  foreach $exe(@exes) {
    `module load biotools; $exe >> $TESTFILE 2>&1`;
  }
  ok(`grep -c "[vV]ersion:" $TESTFILE` == 36, 'all bedtools exes work');
  `rm -f $TESTFILE`;
}

$packageHome = '/opt/biotools/biopython';
SKIP: {
  skip 'biopython not installed', 1 if ! -d $packageHome;
  `cp -r $packageHome/Tests .`;
  $output = `module load biotools; python Tests/test.py 2>&1`;
  $count = 0;
  foreach $line(split(/\n/, $output)) {
    $count++ if $line =~ / ok/;
  }
  ok($count >= 181, 'biopython works');
  `rm -rf Tests`;
}

$packageHome = '/opt/biotools/bismark';
SKIP: {
  skip 'bismark not installed', 1 if ! -d $packageHome;
  $output = `module load biotools; bismark 2>&1`;
  ok($output =~ /USAGE: bismark [options] <genome_folder> {-1 <mates1> -2 <mates2> | <singles>}/, 'bismark works');
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
module load biotools
cd $TESTFILE.dir
wget ftp://ftp.ncbi.nlm.nih.gov/blast/db/FASTA/drosoph.nt.gz
gunzip drosoph.nt.gz
makeblastdb -dbtype nucl -in *.nt
blastn -db *.nt  -query $TESTFILE.in -task blastn -out out
END
  close(OUT);
  `bash $TESTFILE.sh 2>&1`;
  $output = `cat $TESTFILE.dir/out`;
  like($output, qr/Score = 33.7 bits \(36\),  Expect = 4.5/, 'blast works');
  `rm -rf $TESTFILE*`;
}

my $packageHome = '/opt/biotools/blat';
SKIP: {
  skip 'blat not installed', 1 if ! -d $packageHome;
  `module load biotools; blat -verbose=0 $packageHome/test/target.fa $packageHome/test/query.fa blat.out -minScore=190 >/dev/null 2>&1`;
  `/usr/bin/cmp $packageHome/test/test1.psl blat.out`;
  ok($? == 0, 'blat works');
  `/bin/rm -f blat.out`;
}

$packageHome = '/opt/biotools/bowtie';
SKIP: {
  skip 'bowtie not installed', 1 if ! -d $packageHome;
  $output = `module load biotools; cd $packageHome/bin; perl $packageHome/scripts/test/inspect.pl 2>&1`;
  like($output, qr/PASSED/, 'bowtie works');
}

$packageHome = '/opt/biotools/bowtie2';
SKIP: {
  skip 'bowtie2 not installed', 1 if ! -d $packageHome;
  $output = `module load biotools; bowtie2 -p 8 -x $packageHome/indexes/lambda_virus $packageHome/reads/reads_1.fq 2>&1`;
  like($output, qr/94.04% overall alignment rate/, 'bowtie2 works');
}

$packageHome = '/opt/biotools/bx-python';
SKIP: {
  skip 'bx-python not installed', 1 if ! -d $packageHome;
  $output=`module load biotools; python -c 'from bx import binned_array_tests; print binned_array_tests.setup()' 2>&1`;
  like($output, qr/bx.binned_array.BinnedArray object/, 'bx-python works');
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
  `module load biotools; bwa index -p mg323 -a is mg323.fa >/dev/null 2>&1`;
  ok(-f 'mg323.amb' && -f 'mg323.ann' && -f 'mg323.bwt' && -f 'mg323.pac' &&
     -f 'mg323.sa', 'bwa index run works');
  `/bin/rm -f mg323.*`;
}

$packageHome = '/opt/biotools/cufflinks';
SKIP: {
  skip 'cufflinks not installed', 1 if ! -d $packageHome;
  `mkdir $TESTFILE.dir`;
  $output = `module load biotools; cd $TESTFILE.dir; cufflinks $packageHome/test_data.sam 2>&1`;
  like($output, qr/Default Mean: 200/, 'cufflinks works');
  `rm -rf $TESTFILE.dir`;
}

$packageHome = '/opt/biotools/dendropy';
SKIP: {
  skip 'dendropy not installed', 1 if ! -d $packageHome;
  $output = `module load biotools; python $packageHome/test/test_popgenstat.py 2>&1`;
  like($output, qr/OK/, 'dendropy works');
}

$packageHome = '/opt/biotools/edena';
SKIP: {
  skip 'edena not installed', 1 if ! -d $packageHome;
  # TODO: test
  skip 'no edena test written', 1;
}

$packageHome = '/opt/biotools/fastqc';
SKIP: {
  skip 'fastax not installed', 1 if ! -d $packageHome;
  `/bin/ls $packageHome/fastqc 2>&1`;
  ok($? == 0, 'fastqc script installed');
  # TODO: test
  skip 'no fastax test written', 1;
}

$packageHome = '/opt/biotools/fastx';
SKIP: {
  skip 'fastx not installed', 1 if ! -d $packageHome;
  $output = `module load biotools; seqalign_test 2>&1`;
  like($output, qr/A(AGGTTT)CCC/, 'fastx works');
}

$packageHome = '/opt/biotools/GenomeAnalysisTK';
SKIP: {
  skip 'GenomeAnalysisTK not installed', 1 if ! -d $packageHome;
  $output = `module load biotools; java -jar $packageHome/GenomeAnalysisTK.jar -R $packageHome/resources/exampleFASTA.fasta -I $packageHome/resources/exampleBAM.bam -T CountReads 2>&1`;
  like($output, qr/33 reads in the traversal/, 'GenomeAnalysisTK works');
}

$packageHome = '/opt/biotools/gmap_gsnap';
SKIP: {
  skip 'gmap_gsnap not installed', 1 if ! -d $packageHome;
  $output = `module load biotools; gmap -A -g $packageHome/tests/ss.chr17test $packageHome/tests/ss.her2 2>&1`;
  like($output, qr/Trimmed coverage: 100.0 \(trimmed length: 4624 bp, trimmed region: 1..4624\)/, 'gmap_gsnap works');
}

$packageHome = '/opt/biotools/htseq';
SKIP: {
  skip 'htseq not installed', 1 if ! -d $packageHome;
  `module load biotools; python -c "import HTSeq" > /dev/null 2>&1`;
  ok($? eq 0, 'htseq works');
}

$packageHome = '/opt/biotools/idba-ud';
SKIP: {
  skip 'idba-ud not installed', 1 if ! -d $packageHome;
  # TODO: test
  skip 'no idba-ud test written', 1;
}

$packageHome = '/opt/biotools/matt';
SKIP: {
  skip 'matt not installed', 1 if ! -d $packageHome;
  $output = `module load biotools; Matt 2>&1`;
  like($output, qr/Matt version 1.00 Single Threaded build./, 'matt works');
}

$packageHome = '/opt/biotools/miRDeep2';
SKIP: {
  skip 'miRDeep2 not installed', 1 if ! -d $packageHome;
  `mkdir $TESTFILE.dir`;
  open(OUT, ">$TESTFILE.sh");
  print OUT <<END;
module load biotools
cd $TESTFILE.dir
cp -r $packageHome/tests/* .
bowtie-build cel_cluster.fa cel_cluster
mapper.pl reads.fa -c -j -k TCGTATGCCGTCTTCTGCTTGT  -l 18 -m -p cel_cluster -s reads_collapsed.fa -t r
eads_collapsed_vs_genome.arf -v
quantifier.pl -p precursors_ref_this_species.fa -m mature_ref_this_species.fa -r reads_collapsed.fa -t cel -y 16_19
miRDeep2.pl reads_collapsed.fa cel_cluster.fa reads_collapsed_vs_genome.arf mature_ref_this_species.fa mature_ref_other_species.fa precursors_ref_this_species.fa -t C.elegans 2> report.log
cat miRNAs_expressed_all_samples_16_19.csv
END
  close(OUT);
  $output = `bash $TESTFILE.sh 2>&1`;
  like($output, qr/cel-miR-41\s+87.00\s+cel-mir-41\s+87.00\s+87.00\s+509.68/, 'miRDeep2 works');
 `rm -rf $TESTFILE*`;
}

$packageHome = '/opt/biotools/miso';
SKIP: {
  skip 'miso not installed', 1 if ! -d $packageHome;
  $output = `module load biotools; python $packageHome/lib/python2.7/site-packages/misopy/test_miso.py 2>&1`;
  like($output, qr/OK/, 'miso works');
}

$packageHome = '/opt/biotools/picard';
SKIP: {
  skip 'picard not installed', 1 if ! -d $packageHome;
  $output = `module load biotools; java -jar $packageHome/FastqToSam.jar --help 2>&1`;
  like($output, qr/Extracts read sequences and qualities from the input fastq file/, 'picard works');
}

$packageHome = '/opt/biotools/plink';
SKIP: {
  skip 'plink not installed', 1 if ! -d $packageHome;
  `mkdir $TESTFILE.dir`;
  `cp $packageHome/examples/* $TESTFILE.dir`;
  $output = `module load biotools; cd $TESTFILE.dir; plink --file hapmap1 2>&1`;
  like($output, qr/After frequency and genotyping pruning, there are 83534 SNPs/, 'plink works');
  `rm -rf $TESTFILE.dir`;
}

$packageHome = '/opt/biotools/pysam';
SKIP: {
  skip 'pysam not installed', 1 if ! -d $packageHome;
  $output = `module load biotools; python -c 'import pysam; print pysam.SAMTOOLS_DISPATCH' 2>&1`;
  like($output, qr/pad2unpad/, 'pysam works');
}

$packageHome = '/opt/biotools/qiime';
SKIP: {
  skip 'qimme not installed', 1 if ! -d $packageHome;
  `mkdir $TESTFILE.dir`;
  $output = `module load biotools; cd $TESTFILE.dir; python $packageHome/tests/all_tests.py`;
  $count = 0;
  foreach $line(split(/\n/, $output)) {
    $count++ if $line =~ / ok/;
    $count++ if $line =~ /^OK/;
    $count++ if $line =~ /^ok/;
  }
  ok($count >= 676, 'qiime works');
  `rm -rf $TESTFILE*`;
}

$packageHome = '/opt/biotools/randfold';
SKIP: {
  skip 'randfold not installed', 1 if ! -d $packageHome;
  $output = `module load biotools; randfold -d $packageHome/tests/let7.tfa 999 2>&1`;
  like($output, qr/cel-let-7\s+-42.90\s+0.001000/, 'randfold works');
}

$packageHome = '/opt/biotools/samtools';
SKIP: {
  skip 'samtools not installed', 1 if ! -d $packageHome;
  `module load biotools; cd $packageHome/examples; samtools faidx ex1.fa`;
  $output = `cat $packageHome/examples/ex1.fa.fai`;
  like($output, qr/seq2/, 'samtools index run works');
  `/bin/rm -f $packageHome/examples/ex1.fa.fai`;
}

$packageHome = '/opt/biotools/SOAPsnp';
SKIP: {
  skip 'SOAPsnp not installed', 1 if ! -d $packageHome;
  $output = `module load biotools; soapsnp 2>&1`;
  like($output, qr/Compulsory Parameters:/, 'SOAPsnp executable works');
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
  `module load biotools; SOAPdenovo-63mer pregraph -K 31 -s SRR000046.config -o SRR000046 2>&1`;
  ok(-f './SRR000046.preArc', 'soapdenovo pregraph works');
  `/bin/rm SRR000046*`;
}

$packageHome = '/opt/biotools/spades';
SKIP: {
  skip 'spades not installed', 1 if ! -d $packageHome;
  $output = `module load biotools; python $packageHome/bin/spades.py --test 2>&1`;
  like($output, qr/TEST PASSED CORRECTLY./, 'spades executable works');
  `rm -rf spades_test`;
}

$packageHome = '/opt/biotools/squid';
SKIP: {
  skip 'squid not installed', 1 if ! -d $packageHome;
  `mkdir $TESTFILE.dir`;
  open(OUT, ">$TESTFILE.sh");
  print OUT <<END;
module load biotools
cd $TESTFILE.dir
cp -r $packageHome/tests/* .
XBASE='x-base-afetch x-base-alistat x-base-seqstat x-base-sfetch x-base-shuffle x-base-sindex x-base-sreformat'
BUGLIST=bug-1-sfetch-paths
for xprog in \$XBASE; do
  ./\$xprog
done
for bugprog in \$BUGLIST; do
  ./\$bugprog
done
END
  close(OUT);
  $output = `bash $TESTFILE.sh 2>&1`;
  $count = 0;
  foreach $line(split(/\n/, $output)) {
    $count++ if $line =~ /ok/;
  }
  ok($count == 8, 'squid works');
  `rm -rf $TESTFILE*`;
}

$packageHome = '/opt/biotools/tophat';
SKIP: {
  skip 'tophat not installed', 1 if ! -d $packageHome;
  $output = `module load biotools; tophat --help 2>&1`;
  like($output, qr/TopHat maps short sequences from spliced transcripts to whole genomes./, 'tophat executable works');
}

$packageHome = '/opt/biotools/trimmomatic';
SKIP: {
  skip 'trimmomatic not installed', 1 if ! -d $packageHome;
  $output = `module load biotools; java org.usadellab.trimmomatic.TrimmomaticPE 2>&1`;
  like($output, qr/Usage: TrimmomaticPE/, 'trimmomatic works');
}

$packageHome = '/opt/biotools/trinity';
SKIP: {
  skip 'trinity not installed', 1 if ! -d $packageHome;
  `mkdir $TESTFILE.dir`;
  $output = `module load biotools; cd $TESTFILE.dir; cp $packageHome/sample_data/test_Trinity_Assembly/*.gz .; $packageHome/sample_data/test_Trinity_Assembly/runMe.sh 2>&1`;
  like($output, qr/All commands completed successfully. :-\)/, 'trinity works');
  `rm -rf $TESTFILE.dir`;
}

$packageHome = '/opt/biotools/velvet';
SKIP: {
  skip 'velvet not installed', 1 if ! -d $packageHome;
  `mkdir $TESTFILE.dir`;
  $output = `module load biotools; cd $TESTFILE.dir; $packageHome/testdata/run-tests.sh 2>&1`;
  like($output, qr/passed all 5 tests/, 'velvet works');
  `rm -rf $TESTFILE.dir`;
}

$packageHome = '/opt/biotools/ViennaRNA';
SKIP: {
  skip 'ViennaRNA not installed', 1 if ! -d $packageHome;
  `mkdir $TESTFILE.dir`;
  open(OUT, ">$TESTFILE.sh");
  print OUT <<END;
module load biotools
cd $TESTFILE.dir
cp -r $packageHome/tests/* .
perl test.pl
END
  close(OUT);
  $output = `bash $TESTFILE.sh 2>&1`;
  $count = 0;
  foreach $line(split(/\n/, $output)) {
    $count++ if $line =~ /ok/;
  }
  ok($count == 24, 'ViennaRNA works');
  `rm -rf $TESTFILE*`;
}

$packageHome = '/opt/biotools/stacks';
SKIP: {
  skip 'stacks not installed', 1 if ! -d $packageHome;
  $output = `module load biotools; cstacks 2>&1`;
  like($output, qr/cstacks 1.20/, 'stacks works');
}

$packageHome = '/opt/biotools/rseqc';
SKIP: {
  skip 'rseqc not installed', 1 if ! -d $packageHome;
  $output = `module load biotools;clipping_profile.py 2>&1`;
  like($output, qr/This program is used estimate clipping profile/, 'rseqc works');
}

SKIP: {

  skip 'biotools not installed', 3 if ! $isInstalled;
  `/bin/ls /opt/modulefiles/applications/biotools/[0-9]* 2>&1`;
  ok($? == 0, 'biotools module installed');
  `/bin/ls /opt/modulefiles/applications/biotools/.version.[0-9]* 2>&1`;
  ok($? == 0, 'biotools version module installed');
  ok(-l '/opt/modulefiles/applications/biotools/.version',
     'biotools version module link created');

}
`rm -fr $TESTFILE*`;
