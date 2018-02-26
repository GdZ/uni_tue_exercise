CC=gcc
CFLAGS=-Wall -std=c99
DEBUG=-O0 -g

all:
	$(CC) $(CFLAGS) $(DEBUG) reverse.c -o reverse
	$(CC) $(CFLAGS) $(DEBUG) mycopy.c -o mycopy

mycopy:
	$(CC) $(CFLAGS) $(DEBUG) mycopy.c -o mycopy

reverse:
	$(CC) $(CFLAGS) $(DEBUG) reverse.c -o reverse

clean:
	rm -vfr *~ mycopy reverse
