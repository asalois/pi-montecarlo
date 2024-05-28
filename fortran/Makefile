# Configuration settings
FC := gfortran
FFLAGS := -Ofast -march=native -fopenmp

EXE0 := calc.o
SRC0 := calc.f90
EXE1 := omp_calc.o
SRC1 := omp_calc.f90

# Declare all public targets
.PHONY: all clean

build: clean
	$(FC) $(FFLAGS) $(SRC0) -o $(EXE0)
	$(FC) $(FFLAGS) $(SRC1) -o $(EXE1)

# Cleanup, filter to avoid removing source code by accident
clean: 
	rm -rf $(EXE0) $(EXE1)
