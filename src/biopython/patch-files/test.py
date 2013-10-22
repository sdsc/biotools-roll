
import os
import sys

class test_biopython:
    description = "Automatically run the test suite for Biopython."
    user_options = []

    def __init__(self):
        pass      
    def initialize_options(self):
        pass

    def finalize_options(self):
        pass

    def run(self):
        this_dir = os.getcwd()

        # change to the test dir and run the tests
        os.chdir("Tests")
        sys.path.insert(0, '')
        import run_tests
        run_tests.main([])

        # change back to the current directory
        os.chdir(this_dir)


