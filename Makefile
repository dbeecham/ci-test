.PHONY: clean directories

default: all

all: directories ci

directories:
	mkdir -p build

build/ci.o: src/ci.c
	gcc ${CFLAGS} -c $? -o $@

build/run-tests.o: src/run-tests.c
	gcc ${CFLAGS} -c $? -o $@

build/mylib.o: src/mylib.c
	gcc ${CFLAGS} -c $? -o $@

run-tests: CFLAGS += -ftest-coverage -O0 -Wextra -Wall -fprofile-arcs
run-tests: build/run-tests.o build/mylib.o
	gcc ${CFLAGS} $? -o $@

ci: build/mylib.o build/ci.o 
	gcc ${CFLAGS} $? -o $@

test: directories run-tests
	./run-tests

clean:
	rm run-tests ci build run-tests.gcno -rf
