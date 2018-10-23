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
  'bamtools', 'bcftools', 'bedtools', 'biopython', 'bioperl','bismark', 'blast', 'blat',
  'bowtie', 'bowtie2', 'bwa', 'bx-python', 'celera','cufflinks', 'dendropy',
  'diamond', 'edena', 'emboss','fastqc', 'fastx', 'GenomeAnalysisTK',
  'gmap_gsnap', 'hmmer','htseq', 'idba-ud', 'matt', 'miRDeep2', 'miso',
  'NucleoATAC', 'picard', 'plink', 'pysam', 'randfold', 'rseqc',
  'samtools', 'soapdenovo', 'SOAPsnp', 'spades', 'squid', 'stacks', 'tophat',
  'trimmomatic', 'trinity', 'vcftools', 'velvet', 'ViennaRNA'
);
my $isInstalled = -d '/opt/biotools';
my $output;
my $TESTFILE = 'tmpbiotools';
`rm -rf $TESTFILE*`;

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
  $output = `module load bamtools; cd $TESTFILE.dir; g++ -o test -I$packageHome/include/bamtools test.cc -L$packageHome/lib/bamtools -lbamtools; ./test test.bam 2>&1`;
  like($output, qr/Qualities ;44999;499<8<8<<<8<<><<<<><7<;<<<>><</, 'bamtools works');
  `rm -rf $TESTFILE*`;
}

$packageHome = '/opt/biotools/bcftools';
SKIP: {
  skip 'bcftools not installed', 1 if ! -d $packageHome;
  $output = `module load bcftools; $packageHome/test/test.pl 2>&1`;
  like($output, qr/failed\s*\.\.\s*0/, 'bcftools works');
  `rm -rf $TESTFILE.dir`;
}

$packageHome = '/opt/biotools/bedtools';
SKIP: {
  skip 'bedtools not installed', 1 if ! -d $packageHome;
  my @exes = ('annotateBed','bedToBam','complementBed','genomeCoverageBed','mapBed','nucBed','slopBed','windowBed','bamToBed','bedToIgv','coverageBed','getOverlap','maskFastaFromBed','pairToBed','sortBed','windowMaker','bamToFastq','expandCols','groupBy','mergeBed','pairToPair','subtractBed','bed12ToBed6','closestBed','fastaFromBed','intersectBed','multiBamCov','randomBed','tagBam','bedpeToBam','clusterBed','flankBed','linksBed','shuffleBed');
  foreach $exe(@exes) {
    `module load bedtools; $exe --help >> $TESTFILE 2>&1`;
  }
  @exes = ('unionBedGraphs','multiIntersectBed');
  foreach $exe(@exes) {
    `module load bedtools; $exe >> $TESTFILE 2>&1`;
  }
  ok(`grep -c "[vV]ersion:" $TESTFILE` == 36, 'all bedtools exes work');
  `rm -f $TESTFILE`;
}


$packageHome = '/opt/biotools/bioperl';
SKIP: {
  skip 'bioperl not installed', 1 if ! -d $packageHome;
  @bioperltests=`ls $packageHome/tests/Phenotype/*.t`;
  `rm -f out.$$`;
  foreach my $bioperltest(@bioperltests) {
     chomp($bioperltest);
     `module load bioperl;perl $bioperltest >> out.$$`;
   }
   ok(`grep -c ok out.$$` == 548, 'bioperl works');
   `rm -f out.$$`;
}

$packageHome = '/opt/biotools/biopython';
SKIP: {
  skip 'biopython not installed', 1 if ! -d $packageHome;
  $output = `module load biopython; python $packageHome/Tests/test_lowess.py 2>&1`;
  like($output, qr/OK/, 'biopython works');
}

$packageHome = '/opt/biotools/bismark';
SKIP: {
  skip 'bismark not installed', 1 if ! -d $packageHome;
  $output = `module load bismark; bismark 2>&1`;
  ok($output =~ /USAGE: bismark [options] <genome_folder> {-1 <mates1> -2 <mates2> | <singles>}/, 'bismark works');
}

$packageHome = '/opt/biotools/blast';
SKIP: {
  skip 'blast not installed', 1 if ! -d $packageHome;
  `mkdir $TESTFILE.dir`;
  if(-e 'drosoph.nt.gz') {
    `cp drosoph.nt.gz $TESTFILE.dir/`;
  } else {
    `cd $TESTFILE.dir; wget ftp://ftp.ncbi.nlm.nih.gov/blast/db/FASTA/drosoph.nt.gz 2>&1 /dev/null`;
  }
  skip 'unable to retrieve blast test data', 1
    if ! -e "$TESTFILE.dir/drosoph.nt.gz";
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
module load blast
cd $TESTFILE.dir
gunzip drosoph.nt.gz
makeblastdb -dbtype nucl -in *.nt
blastn -db *.nt  -query $TESTFILE.in -task blastn -out out
END
  close(OUT);
  `bash $TESTFILE.sh 2>&1`;
  $output = `cat $TESTFILE.dir/out`;
  like($output, qr/Score = 33.7 bits \(36\),  Expect = 3.9/, 'blast works');
  `rm -rf $TESTFILE*`;
}

my $packageHome = '/opt/biotools/blat';
SKIP: {
  skip 'blat not installed', 1 if ! -d $packageHome;
  `module load blat; blat -verbose=0 $packageHome/test/target.fa $packageHome/test/query.fa blat.out -minScore=190 >/dev/null 2>&1`;
  `/usr/bin/cmp $packageHome/test/test1.psl blat.out`;
  ok($? == 0, 'blat works');
  `/bin/rm -f blat.out`;
}

$packageHome = '/opt/biotools/bowtie';
SKIP: {
  skip 'bowtie not installed', 1 if ! -d $packageHome;
  $output = `module load bowtie;export BOWTIE_INDEXES=$packageHome/indexes;bowtie e_coli $packageHome/reads/e_coli_1000.fq 2>&1`;
  like($output, qr/Reported 699 alignments to 1 output stream\(s\)/, 'bowtie works');
}

$packageHome = '/opt/biotools/bowtie2';
SKIP: {
  skip 'bowtie2 not installed', 1 if ! -d $packageHome;
  $output = `module load bowtie2; bowtie2 -p 8 -x $packageHome/indexes/lambda_virus $packageHome/reads/reads_1.fq 2>&1`;
  like($output, qr/94.04% overall alignment rate/, 'bowtie2 works');
}

$packageHome = '/opt/biotools/bx-python';
SKIP: {
  skip 'bx-python not installed', 1 if ! -d $packageHome;
  $output=`module load bx-python; python -c 'from bx import binned_array_tests; print binned_array_tests.setup()' 2>&1`;
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
  `module load bwa; bwa index -p mg323 -a is mg323.fa >/dev/null 2>&1`;
  ok(-f 'mg323.amb' && -f 'mg323.ann' && -f 'mg323.bwt' && -f 'mg323.pac' &&
     -f 'mg323.sa', 'bwa index run works');
  `/bin/rm -f mg323.*`;
}

$packageHome = '/opt/biotools/celera';
SKIP: {
  skip 'celera not installed', 1 if ! -d $packageHome;
  `mkdir $TESTFILE.dir`;
open(OUT, ">$TESTFILE.sh");
print OUT <<END;
  cd $TESTFILE.dir
  cp -r $packageHome/test/* .
  java -jar convertFastaAndQualToFastq.jar pacbio.filtered_subreads.fasta > pacbio.filtered_subreads.fastq
  module load celera
  PBcR -threads 4 -length 500 -partitions 200 -l lambda -s pacbio.spec -fastq pacbio.filtered_subreads.fastq genomeSize=50000
END
  $output = `bash $TESTFILE.sh 2>&1`;
  like($output, qr/Contig_SurrBaseLength           1226549/, 'celera works');
  `rm -rf $TESTFILE*`;
}

$packageHome = '/opt/biotools/dendropy';
SKIP: {
  skip 'dendropy not installed', 1 if ! -d $packageHome;
  $output = `module load dendropy; python $packageHome/test/test_popgenstat.py 2>&1`;
  like($output, qr/OK/, 'dendropy works');
}

$packageHome = '/opt/biotools/diamond';
SKIP: {
  skip 'diamond not installed', 1 if ! -d $packageHome;
  $output = `module load diamond; diamond -h 2>&1`;
  like($output, qr/blastp/, 'diamond works');
}

$packageHome = '/opt/biotools/edena';
SKIP: {
  skip 'edena not installed', 1 if ! -d $packageHome;
  $output = `module load edena; edena 2>&1`;
  like($output, qr/Edena v/, 'edena works');
}

$packageHome = '/opt/biotools/emboss';
SKIP: {
  skip 'emboss not installed', 1 if ! -d $packageHome;
  `mkdir $TESTFILE.dir`;
  `cd $TESTFILE.dir;module load emboss; extractseq $packageHome/test/tembl:x65923 result.seq -regions "10-20" >& /dev/null`;
  $output=`cat $TESTFILE.dir/result.seq`;
  like($output, qr/ctcgactccat/, 'emboss works');
  `rm -rf $TESTFILE*`;
}

$packageHome = '/opt/biotools/fastqc';
SKIP: {
  skip 'fastqc not installed', 1 if ! -d $packageHome;
  $output = `module load fastqc; fastqc -help 2>&1`;
  like($output, qr/FastQC - A high throughput sequence QC analysis tool/, 'fastqc works');
}

$packageHome = '/opt/biotools/fastx';
SKIP: {
  skip 'fastx not installed', 1 if ! -d $packageHome;
  $output = `module load fastx; seqalign_test 2>&1`;
  like($output, qr/A(AGGTTT)CCC/, 'fastx works');
}

$packageHome = '/opt/biotools/GenomeAnalysisTK/3.5';
SKIP: {
  skip 'GenomeAnalysisTK not installed', 1 if ! -d $packageHome;
  $output = `module load GenomeAnalysisTK/3.5; java -jar $packageHome/GenomeAnalysisTK.jar -R $packageHome/resources/exampleFASTA.fasta -I $packageHome/resources/exampleBAM.bam -T CountReads 2>&1`;
  like($output, qr/33 reads in the traversal/, 'GenomeAnalysisTK 3.5 works');
}
$packageHome = '/opt/biotools/GenomeAnalysisTK/4.0.4.0';
SKIP: {
  skip 'GenomeAnalysisTK not installed', 1 if ! -d $packageHome;
  $output = `module load GenomeAnalysisTK; gatk CountReads -R $packageHome/resources/exampleFASTA.fasta -I $packageHome/resources/exampleBAM.bam 2>&1`;
  like($output, qr/ProgressMeter - Traversal complete. Processed 33 total reads/, 'GenomeAnalysisTK 4.0.4.0 works');
}

$packageHome = '/opt/biotools/gmap_gsnap';
SKIP: {
  skip 'gmap_gsnap not installed', 1 if ! -d $packageHome;
  $output = `module load gmap_gsnap; gmap -A -g $packageHome/tests/ss.chr17test $packageHome/tests/ss.her2 2>&1`;
  like($output, qr/Trimmed coverage: 100.0 \(trimmed length: 4624 bp, trimmed region: 1..4624\)/, 'gmap_gsnap works');
}

$packageHome = '/opt/biotools/hmmer';
SKIP: {
  skip 'hmmer not installed', 1 if ! -d $packageHome;
  `mkdir $TESTFILE.dir`;
  `cp -r $packageHome/testsuite $TESTFILE.dir`;
  `cd $TESTFILE.dir/testsuite;ln -s $packageHome/bin ../bin`;
  $output=`module load hmmer; cd $TESTFILE.dir/testsuite; make check 2>&1`;
  like($output, qr/All 260 exercises at level <= 2 passed./, 'hmmer works');
  `rm -rf $TESTFILE*`;
}
$packageHome = '/opt/biotools/htseq';
SKIP: {
  skip 'htseq not installed', 1 if ! -d $packageHome;
  `module load htseq; python -c "import HTSeq" > /dev/null 2>&1`;
  ok($? eq 0, 'htseq works');
}

$packageHome = '/opt/biotools/idba-ud';
SKIP: {
  skip 'idba-ud not installed', 1 if ! -d $packageHome;
  $output = `module load idba-ud; idba_ud 2>&1`;
  like($output, qr/Iterative de Bruijn Graph Assembler/, 'idba-ud works');
}

$packageHome = '/opt/biotools/matt';
SKIP: {
  skip 'matt not installed', 1 if ! -d $packageHome;
  $output = `module load matt; Matt 2>&1`;
  like($output, qr/Matt version 1.00 Single Threaded build./, 'matt works');
}

$packageHome = '/opt/biotools/miRDeep2';
SKIP: {
`mkdir $TESTFILE.dir`;
open(OUT, ">$TESTFILE.sh");
print OUT <<END;
module load miRDeep2
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
  like($output, qr/cel-miR-41\s+87.00/, 'miRDeep2 works');
  `rm -rf $TESTFILE*`;
}

$packageHome = '/opt/biotools/miso';
SKIP: {
  skip 'miso not installed', 1 if ! -d $packageHome;
  $output = `module load miso; python $packageHome/lib/python2.7/site-packages/misopy/test_miso.py 2>&1`;
  like($output, qr/OK/, 'miso works');
}

$packageHome = '/opt/biotools/NucleoATAC';
SKIP: {
  skip 'NucleoATAC not installed', 1 if ! -d $packageHome;
  $output = `module load NucleoATAC; nucleoatac run --help 2>&1`;
  like($output, qr/start run at:/, 'NucleoATAC works');
}

$packageHome = '/opt/biotools/picard';
SKIP: {
  skip 'picard not installed', 1 if ! -d $packageHome;
  # toy.bam from samtools sources
  open(OUT, ">$TESTFILE.sam");
  print OUT <<'END';
@SQ	SN:ref	LN:45
@SQ	SN:ref2	LN:40
r001	163	ref	7	30	8M4I4M1D3M	=	37	39	TTAGATAAAGAGGATACTG	*	XX:B:S,12561,2,20,112
r002	0	ref	9	30	1S2I6M1P1I1P1I4M2I	*	0	0	AAAAGATAAGGGATAAA	*
r003	0	ref	9	30	5H6M	*	0	0	AGCTAA	*
r004	0	ref	16	30	6M14N1I5M	*	0	0	ATAGCTCTCAGC	*
r003	16	ref	29	30	6H5M	*	0	0	TAGGC	*
r001	83	ref	37	30	9M	=	7	-39	CAGCGCCAT	*
x1	0	ref2	1	30	20M	*	0	0	aggttttataaaacaaataa	????????????????????
x2	0	ref2	2	30	21M	*	0	0	ggttttataaaacaaataatt	?????????????????????
x3	0	ref2	6	30	9M4I13M	*	0	0	ttataaaacAAATaattaagtctaca	??????????????????????????
x4	0	ref2	10	30	25M	*	0	0	CaaaTaattaagtctacagagcaac	?????????????????????????
x5	0	ref2	12	30	24M	*	0	0	aaTaattaagtctacagagcaact	????????????????????????
x6	0	ref2	14	30	23M	*	0	0	Taattaagtctacagagcaacta	???????????????????????
END
  close(OUT);
  $output = `module load picard; java -jar $packageHome/picard.jar CollectAlignmentSummaryMetrics INPUT=$TESTFILE.sam OUTPUT=$TESTFILE.out 2>&1; cat $TESTFILE.out`;
  like($output, qr/UNPAIRED\s+10/, 'picard works');
  `rm -rf $TESTFILE*`;
}

$packageHome = '/opt/biotools/plink';
SKIP: {
  skip 'plink not installed', 1 if ! -d $packageHome;
  `mkdir $TESTFILE.dir`;
  `cp $packageHome/examples/* $TESTFILE.dir`;
  $output = `module load plink; cd $TESTFILE.dir; plink --file hapmap1 2>&1;cat plink.log`;
  like($output, qr/83534 variants, 89 people/, 'plink works');
  `rm -rf $TESTFILE.dir`;
}

$packageHome = '/opt/biotools/pysam';
SKIP: {
  skip 'pysam not installed', 1 if ! -d $packageHome;
  $output = `module load pysam; python -c 'import pysam; print pysam.SAMTOOLS_DISPATCH' 2>&1`;
  like($output, qr/pad2unpad/, 'pysam works');
}

$packageHome = '/opt/biotools/randfold';
SKIP: {
  skip 'randfold not installed', 1 if ! -d $packageHome;
  $output = `module load randfold; randfold -d $packageHome/tests/let7.tfa 999 2>&1`;
  like($output, qr/cel-let-7\s+-42.90\s+0.001000/, 'randfold works');
}

$packageHome = '/opt/biotools/samtools/1.3';
SKIP: {
  skip 'samtools not installed', 1 if ! -d $packageHome;
  `mkdir $TESTFILE.dir`;
  `module load samtools; cd $TESTFILE.dir; cp -r $packageHome/examples/* .; samtools faidx ex1.fa`;
  $output = `cat $TESTFILE.dir/ex1.fa.fai`;
  like($output, qr/seq2/, 'samtools 1.3 index run works');
  `/bin/rm -f $packageHome/examples/ex1.fa.fai`;
  `rm -rf $TESTFILE.dir`;
}

$packageHome = '/opt/biotools/samtools/1.2';
SKIP: {
  skip 'samtools not installed', 1 if ! -d $packageHome;
  `mkdir $TESTFILE.dir`;
  `module load samtools/1.2; cd $TESTFILE.dir; cp -r $packageHome/examples/* .; samtools faidx ex1.fa`;
  $output = `cat $TESTFILE.dir/ex1.fa.fai`;
  like($output, qr/seq2/, 'samtools 1.2 index run works');
  `/bin/rm -f $packageHome/examples/ex1.fa.fai`;
  `rm -rf $TESTFILE.dir`;
}

$packageHome = '/opt/biotools/SOAPsnp';
SKIP: {
  skip 'SOAPsnp not installed', 1 if ! -d $packageHome;
  $output = `module load SOAPsnp; soapsnp 2>&1`;
  like($output, qr/Compulsory Parameters:/, 'SOAPsnp executable works');
}

$packageHome = '/opt/biotools/soapdenovo';
SKIP: {
  skip 'soapdenovo not installed', 1 if ! -d $packageHome;
  $output=`module load soapdenovo;SOAPdenovo-63mer 2>&1`;
  like($output, qr/Usage: SOAPdenovo <command> \[option\]/,'soapdenovo works');
  `/bin/rm -rf $TESTFILE*`;
}

$packageHome = '/opt/biotools/spades';
SKIP: {
  skip 'spades not installed', 1 if ! -d $packageHome;
  $output = `module load spades; python $packageHome/bin/spades.py --test 2>&1`;
  like($output, qr/TEST PASSED CORRECTLY./, 'spades executable works');
  `rm -rf spades_test`;
}

$packageHome = '/opt/biotools/squid';
SKIP: {
  skip 'squid not installed', 1 if ! -d $packageHome;
  `mkdir $TESTFILE.dir`;
  open(OUT, ">$TESTFILE.sh");
  print OUT <<END;
module load squid
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
  $output = `module load tophat; tophat --help 2>&1`;
  like($output, qr/TopHat maps short sequences from spliced transcripts to whole genomes./, 'tophat executable works');
}

$packageHome = '/opt/biotools/trimmomatic';
SKIP: {
  skip 'trimmomatic not installed', 1 if ! -d $packageHome;
  $output = `module load trimmomatic; java org.usadellab.trimmomatic.TrimmomaticPE 2>&1`;
  like($output, qr/Usage: TrimmomaticPE/, 'trimmomatic works');
}

$packageHome = '/opt/biotools/trinity';
SKIP: {
  skip 'trinity not installed', 1 if ! -d $packageHome;
  `mkdir $TESTFILE.dir`;
  $output = `module load trinity; cd $TESTFILE.dir; cp $packageHome/sample_data/test_Trinity_Assembly/*.gz .; $packageHome/sample_data/test_Trinity_Assembly/runMe.sh 2>&1`;
  like($output, qr/All commands completed successfully. :-\)/, 'trinity works');
  `rm -rf $TESTFILE.dir`;
}

$packageHome = '/opt/biotools/vcftools';
SKIP: {
  skip 'vcftools not installed', 1 if ! -d $packageHome;
  `mkdir $TESTFILE.dir`;
  $output = `module load vcftools; cd $TESTFILE.dir; cp $packageHome/examples/* .;vcftools --vcf cmp-test-a.vcf --diff cmp-test-b.vcf 2>&1`;
  like($output, qr/After filtering, kept 6 out of a possible 6 Sites/, 'vcftools works');
  `rm -rf $TESTFILE.dir`;
}

$packageHome = '/opt/biotools/velvet';
SKIP: {
  skip 'velvet not installed', 1 if ! -d $packageHome;
  `mkdir $TESTFILE.dir`;
  $output = `module load velvet; cd $TESTFILE.dir; $packageHome/testdata/run-tests.sh 2>&1`;
  like($output, qr/passed all 5 tests/, 'velvet works');
  `rm -rf $TESTFILE.dir`;
}

$packageHome = '/opt/biotools/ViennaRNA';
SKIP: {
  skip 'ViennaRNA not installed', 1 if ! -d $packageHome;
  `mkdir $TESTFILE.dir`;
  open(OUT, ">$TESTFILE.sh");
  print OUT <<END;
module load ViennaRNA
cd $TESTFILE.dir
cp -r $packageHome/tests/* .
perl test.pl
END
  close(OUT);
  $output = `bash $TESTFILE.sh 2>&1`;
  $count = 0;
  foreach $line(split(/\n/, $output)) {
    $count++ if $line =~ /^ok/;
  }
  ok($count >= 23, 'ViennaRNA works');
  `rm -rf $TESTFILE*`;
}

$packageHome = '/opt/biotools/stacks';
SKIP: {
  skip 'stacks not installed', 1 if ! -d $packageHome;
  $output = `module load stacks; cstacks 2>&1`;
  like($output, qr/Advanced options:/, 'stacks works');
}

$packageHome = '/opt/biotools/rseqc';
SKIP: {
  skip 'rseqc not installed', 1 if ! -d $packageHome;
  $output = `module load rseqc;clipping_profile.py 2>&1`;
  like($output, qr/This program is used estimate clipping profile/, 'rseqc works');
}

SKIP: {

  skip 'biotools not installed', 3 if ! $isInstalled;
  foreach my $package(@packages) {
     `/bin/ls /opt/modulefiles/applications/$package/[0-9]* 2>&1`;
     ok($? == 0, "$package module installed");
    `/bin/ls /opt/modulefiles/applications/$package/.version.[0-9]* 2>&1`;
      ok($? == 0, "$package version module installed");
     ok(-l "/opt/modulefiles/applications/$package/.version",
     "$package  version module link created");
  }

}

`rm -fr $TESTFILE*`;
