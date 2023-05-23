python ../../../python_stuff/test_data_gen.py > test.in
gcc kalman_test.c kalman_lib.c orientation_conversion.c data.c -lm -o k
./k < test.in > out.csv