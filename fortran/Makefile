# Configuration settings
FC := gfortran
FFLAGS := -Ofast -march=native

EXE := calc.o
SRC := calc.f90

# Declare all public targets
.PHONY: all clean

build: clean
	$(FC) $(FFLAGS) $(SRC) -o $(EXE)

# Cleanup, filter to avoid removing source code by accident
clean: 
	rm -rf $(EXE)
