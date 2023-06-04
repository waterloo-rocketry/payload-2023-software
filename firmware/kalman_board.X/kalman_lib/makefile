CC=gcc
CFLAGS=-I. -Wall

# running `make` will invoke the first recipe
kalman_test: kalman_lib.o data.o orientation_conversion.o
	$(CC) $(CFLAGS) -o kalman_test kalman_test.c $^

orientation_test: orientation_conversion.o kalman_lib.o
	$(CC) $(CFLAGS) -o orientation_test orientation_test.c $^

*.o: *.c
	$(CC) -c -o $@ $< $(CFLAGS)

clean:
	rm -f *.o kalman_test
