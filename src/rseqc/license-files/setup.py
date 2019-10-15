"""
Setup script for RSeQC -- Comprehensive QC package for RNA-seq data
"""

import sys, os, platform, glob
from distutils.core import setup
from setuptools import *

if sys.version_info[0] != 3:
	print("\nYou are using python" + str(sys.version_info[0]) + '.' + str(sys.version_info[1]) + " This verion of RSeQC needs python3!\n", file=sys.stderr)
	sys.exit()	

def main():
	setup(  name = "RSeQC",
            version = "3.0.1",
            python_requires='>=3.5',
            packages = find_packages( 'lib' ),
            package_dir = { '': 'lib' },
            package_data = { '': ['*.ps'] },
            scripts = glob.glob( "scripts/*.py"),
            ext_modules = [],
            py_modules = [ 'psyco_full' ],
            test_suite = 'nose.collector',
            setup_requires = ['nose>=0.10.4','cython>=0.12'],
            author = "Liguo Wang",
			author_email ="wangliguo78@gmail.com",
			platforms = ['Linux','MacOS'],
			requires = ['cython (>=0.17)'],
			install_requires = ['cython>=0.17','pysam','bx-python','numpy', 'pyBigWig'], 
            description = "RNA-seq QC Package",
            url = "http://rseqc.sourceforge.net/",
            zip_safe = False,
            dependency_links = [],
			classifiers=[
              'Development Status :: 5 - Production/Stable',
              'Environment :: Console',
              'Intended Audience :: Science/Research',
              'License :: OSI Approved :: GNU General Public License v2 (GPLv2)',
              'Operating System :: MacOS :: MacOS X',
              'Operating System :: POSIX',
              'Programming Language :: Python',
              'Topic :: Scientific/Engineering :: Bio-Informatics',
              ],
			keywords='RNA-seq, QC',
        )


if __name__ == "__main__":
	main()
