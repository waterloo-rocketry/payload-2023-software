CC=gcc
CFLAGS=-I. -Wall

# running `make` will invoke the first recipe
kalman_test: kalman_lib.o data.o
	$(CC) $(CFLAGS) -o kalman_test kalman_test.c $^

orientation_test: kalman_lib.o data.o
	$(CC) $(CFLAGS) -o orientation_test orientation_test.c $^

*.o: *.c
	$(CC) -c -o $@ $< $(CFLAGS)

clean:
	rm -f *.o kalman_test
