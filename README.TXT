This is Hybrid code.
All TYPE statements have been changed to PRINT
Trying to make sure all COMMON statements are "standardized" (IGOL set to 80)
ENCODE/DECODE still present - sorry don't know how to get rid of this yet
FORBIN has an added line character*1 NA (suggested by S. Lionel - Compaq)
NOTE: ALL COMMON lines have been "normalized" are now identical!
05/09/2000-
common lines rechecked, should be the same now.
note treka.for - horta and trekg.for blish for oddities in common lines
encode/decode have been converted (test conversion) by no way a final result.
trekd - I've removed most of the code from timex, it's never called.
This leaves ASSIGN and RAN, assign can be stripped for single-user play.
RAN should be easy to convert.
Some variable names have been modified as follows:
MAP  changed to MMAP
MIN  changed to MMIN
NO   changed to NNO
IDIM changed to IIDIM
LEN  changed to LEN1
Format statements have been modified as follows:
FORMAT(I) changed to FORMAT(I7)
FORMAT(F) changed to FORMAT(F15.7)
05/10/2000-
Fixed some problems in TREKA, TREKB, and TREKG - minor typing mistakes
Also changed RAN(ISHRT,ISHIT) to RAN(ITOM) to make it more portable
Just removed all ASSIGN statements. Created TREKDP.FOR for this purpose.
It's more portable code.
05/11/2000-
fixed some indentation problems in TREKDP (FIZBIN)
IMPORTANT!-
Fixed Bug in TREKC.FOR line 259 (this one crept back in somehow)
Fixed format statements in all modules to be 72 chars in length or less!
Modules modified TREKA, TREKB, TREKC, TREKDP.FOR
The rest is a mess, and this is where I have
to leave it, as I have no compilers to do anything else with this.
