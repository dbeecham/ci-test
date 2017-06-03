.PHONY: clean

default: all

all: ci

ci: src/ci.c
	gcc src/ci.c -o ci

run-tests: test/run-tests.c
	gcc test/run-tests.c -o run-tests

test: run-tests
	./run-tests

clean:
	rm run-tests ci
