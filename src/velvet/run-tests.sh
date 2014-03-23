#!/usr/bin/env bash

export OMP_NUM_THREADS=1
export PATH=ROLLINSTALL/bin:$PATH

# load shared functions and variables
. ROLLINSTALL/testdata/run-tests.functions

inform "Running Velvet Test Suite"

# check we have our binaries and test files
for FILE in $VH $VG $SEQ $ROADMAP $FQL $FQR $FQI $FAL $FAR $FAI ; do
  if [ ! -r ROLLINSTALL/bin/$FILE  -a ! -r ROLLINSTALL/testdata/$FILE ]; then
    problem "required testing file '$FILE' not found"
  else
    inform "Found $FILE, ok" 
  fi
done

mkdir .tmp
cd .tmp
# create a temp dir
export DIR=$(mktemp -d velvet.test.XXXXXX)
inform "making test folder: $DIR" 

# run each XXXX.t test script
cp ROLLINSTALL/testdata/*z .
NUMTESTS=$(ls -1 ROLLINSTALL/testdata/*.t | wc -l)
COUNT=0
tests=`ls ROLLINSTALL/testdata/*.t`
for TEST in $tests ; do 
  COUNT=$((COUNT + 1))
  inform "running test $COUNT of $NUMTESTS: $TEST"
  . $TEST
  inform "passed test $COUNT"
done

# clean up
inform "removing test folder: $DIR"
rm -fr ./$DIR

cd ..
rm -fr .tmp

# all done
inform "passed all $NUMTESTS tests"
inform "hooray!"
