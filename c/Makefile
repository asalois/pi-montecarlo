# Configuration settings
CC := gcc
FFLAGS := -Ofast -march=native

EXE0 := calcPi.o
SRC0 := calcPi.c

# Declare all public targets
.PHONY: all clean

build: clean
	$(CC) $(FFLAGS) $(SRC0) -o $(EXE0)

# Cleanup, filter to avoid removing source code by accident
clean: 
	rm -rf $(EXE0) $(EXE1)
