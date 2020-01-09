CC=gcc -lstdc++

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
    CFLAGS=-c -Wall -Wextra -Wpedantic -O2 -g
endif
ifeq ($(UNAME_S),Darwin)
    CFLAGS=-c -Wall -O1 -g -Wextra -Wpedantic -I/usr/local/include -g
    CC +=-L/usr/local/lib
endif


all: main

clean:
	rm *.o *.gch tests/*.o tests/queue_tests tests/sha256_asm_tests tests/sha256_tests tests/mining_test main analisis

main.o: main.cpp
	$(CC) $(CFLAGS) main.cpp

main: main.o 
	$(CC) main.o -o main

