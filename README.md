# Automated Software Testing

Automated Software Testing (CS453) by Moonzoo Kim, KAIST

## Homework 4

### Build LLVM

1. Build LLVM with following commands:

    ``` sh
    cd llvm
    ./configure
    make -j4
    ```

    Then directory `llvm/Debug+Asserts` or `llvm/Release+Asserts` will be built.

2. Add the following environment variables:

    ``` sh
    export LLVM_PATH=${PWD}/llvm
    export LLVM_LIB_PATH=${LLVM_PATH}/Debug+Asserts/lib
    export LLVM_BIN_PATH=${LLVM_PATH}/Debug+Asserts/bin
    export PATH=${PATH}:${LLVM_BIN_PATH}
    ```

### Build LLVM Passes

1. The sample Pass `IntWrite` and the template pass `CCov` contain their own
Makefile. You can build `IntWrite` with following commands:

    ``` sh
    cd lib/Transforms/IntWrite
    make
    ```

    Then `IntWrite` Pass is compiled as a static library and stored in the LLVM
    library directory (i.e., `llvm/Debug+Asserts/lib/IntWrite.so`).

2. You need to compile the runtime module as well. The runtime module would be
compiled as an object file, and then given to the linker together with an
instrumented target program. You can compile `intwrite.c`, the runtime module of
`IntWrite` as follows:

    ``` sh
    cd runtime
    clang -c intwrite.c
    ```

    Note that `clang` is compatible with `gcc`, and `clang++` with `g++`.

### Run LLVM Passes

You can instrument a target program with an LLVM Pass as you compile the
target program. You can configure clang to run a given LLVM Pass in the middle
of the compiling process, such that the produced binary gets modified. If the
LLVM Pass inserts a new function declaration with its definition, you should
link the object file with the definition. You can build `test/example.c` with
`IntWrite` instrumentation as follows:

``` sh
cd test
clang -g -Xclang -load -Xclang ${LLVM_LIB_PATH}/IntWrite.so example.c \
  ../runtime/intwrite.o
```

Note that `-g` option was used for `IntWrite` to utilize the debugging
information (e.g. line numbers). As you execute `a.out`, you can see that log
file is produced by the probe executions.

```
$ ./a.out
$ cat log
Line 0: Variable retval <- 0
Line 15: Variable a <- 0
Line 23: Variable a <- 4
Line 27: Variable i <- 0
...
Line 47: Variable a <- 197
```

Similarly, you can run `IntWrite` for `grep.c` as follows:

``` sh
cd test/grep
clang -g -Xclang -load -Xclang ${LLVM_LIB_PATH}/IntWrite.so grep.c \
  ../../runtime/intwrite.o
```

## Homework 5

Run CBMC with:

``` sh
cbmc example.c --unwind 9 --no-unwinding-assertions
```

You can get additional information using `/usr/bin/time`:

``` sh
/usr/bin/time -v cbmc example.c --unwind 9 --no-unwinding-assertions
```

## Homework 6

### C model

We can get the information of loops with `--show-loops` option:

```
$ cbmc cbmc.c --show-loops
file cbmc.c: Parsing
Converting
Type-checking cbmc
file cbmc.c line 144 function main: function `c::nondet_int' is not declared
Generating GOTO Program
Adding CPROVER library
Function Pointer Removal
Partial Inlining
Generic Property Instrumentation
Loop c::verify.0:
  file cbmc.c line 101 function verify

Loop c::verify.1:
  file cbmc.c line 106 function verify

Loop c::verify.2:
  file cbmc.c line 128 function verify

Loop c::verify.3:
  file cbmc.c line 105 function verify

Loop c::main.0:
  file cbmc.c line 143 function main
```

Find a counter example with:

``` sh
cbmc cbmc.c --unwindset \
    c::verify.0:12,c::verify.1:12,c::verify.2:12,c::verify.3:12,c::main.0:7 \
    --no-unwinding-assertions
```

Prove the path of length 7 is the shortest solution by running CBMC with
`c::main.0:6` option:

``` sh
cbmc cbmc.c --unwindset \
    c::verify.0:12,c::verify.1:12,c::verify.2:12,c::verify.3:12,c::main.0:6 \
    --no-unwinding-assertions
```

### Promela model

Generate `pan` with:

```
spin -a crit.pml && gcc pan.c -o pan
```

Then run Spin to find a counter example with the shortest path:

```
./pan -i
```

Then you can see the statements of trail:

```
spin -p -t crit.pml
```
