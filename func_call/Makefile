all: target

target: print_reg.o add2nos.o
	ld -o print_reg print_reg.o add2nos.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

add2nos.o: add2nos.s
	as -g -arch arm64 -o add2nos.o add2nos.s

print_reg.o: print_reg.s
	as -g -arch arm64 -o print_reg.o print_reg.s
