# Device-specific stuff
MAKE_DEFS_LOCAL = lib/mk/local/Make.defs.ANAG
# installation directory
PREFIX = ../_chombo_installation
# Dimensionality
DIM = 2
# Symbol table on or off
DEBUG = TRUE
#Optimization
OPT = FALSE
#Parallel
MPI = FALSE
#I/O
USE_HDF = TRUE

all:
	cp $(MAKE_DEFS_LOCAL) lib/mk/Make.defs.local
	cd lib; make realclean; make -j32 lib DIM=$(DIM) MPI=$(MPI) USE_HDF=$(USE_HDF) DEBUG=$(DEBUG);
	if [ ! -e $(PREFIX) ]; then mkdir $(PREFIX); fi
	if [ ! -e $(PREFIX)/include ]; then mkdir $(PREFIX)/include; fi
	if [ ! -e $(PREFIX)/lib     ]; then mkdir $(PREFIX)/lib    ; fi
	cp -rf lib/src/*/*.H $(PREFIX)/include
	cp -rf lib/*.a  (PREFIX)/lib

