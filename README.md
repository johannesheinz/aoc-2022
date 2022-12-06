# Advent of Code

https://adventofcode.com/2022/


## Programming languages

| **day**    | **challenge**                                                         | **language**            |
|:-----------|:----------------------------------------------------------------------|:------------------------|
| 2022-12-01 | [Day 1: Calorie Counting](https://adventofcode.com/2022/day/1)        | [`Python 3`](#python-3) |
| 2022-12-02 | [Day 2: Rock Paper Scissors](https://adventofcode.com/2022/day/2)     | [`Kotlin`](#kotlin)     |
| 2022-12-03 | [Day 3: Rucksack Reorganization](https://adventofcode.com/2022/day/3) | [`Go`](#go)             |
| 2022-12-04 | [Day 4: Camp Cleanup](https://adventofcode.com/2022/day/4)            | [`Rust`](#rust)         |
| 2022-12-05 | [Day 5: Supply Stacks](https://adventofcode.com/2022/day/5)           | [`C++`](#c)             |
| 2022-12-06 | [Day 6: Tuning Trouble](https://adventofcode.com/2022/day/6)          | [`Scala 2.13`](#scala)  |
| 2022-12-07 | [Day 7: ](https://adventofcode.com/2022/day/7)                        | [`Ruby`](#ruby)         |
| 2022-12-08 | [Day 8: ](https://adventofcode.com/2022/day/8)                        | [`Node.js`](#nodejs)    |
| 2022-12-09 | [Day 9: ](https://adventofcode.com/2022/day/9)                        | [`Elixir`](#elixir)     |
| 2022-12-10 | [Day 10: ](https://adventofcode.com/2022/day/10)                      | [`Java 19`](#java)      |
| 2022-12-11 | [Day 11: ](https://adventofcode.com/2022/day/11)                      | [`PHP`](#php)           |
| 2022-12-12 | [Day 12: ](https://adventofcode.com/2022/day/12)                      | [`Haskell`](#haskell)   |
| 2022-12-13 | [Day 13: ](https://adventofcode.com/2022/day/13)                      | [`Bash`](#bash)         |
| 2022-12-14 | [Day 14: ](https://adventofcode.com/2022/day/14)                      | [`Groovy`](#groovy)     |
| 2022-12-15 | [Day 15: ](https://adventofcode.com/2022/day/15)                      | [`C#`](#c-1)            |
| 2022-12-16 | [Day 16: ](https://adventofcode.com/2022/day/16)                      | [`R`](#r)               |
| 2022-12-17 | [Day 17: ](https://adventofcode.com/2022/day/17)                      | [`Swift`](#swift)       |
| 2022-12-18 | [Day 18: ](https://adventofcode.com/2022/day/18)                      | [`Perl`](#perl)         |
| 2022-12-19 | [Day 19: ](https://adventofcode.com/2022/day/19)                      | [`Fortran`](#fortran)   |
| 2022-12-20 | [Day 20: ](https://adventofcode.com/2022/day/20)                      | [`Lua`](#lua)           |
| 2022-12-21 | [Day 21: ](https://adventofcode.com/2022/day/21)                      | [`Vala`](#vala)         |
| 2022-12-22 | [Day 22: ](https://adventofcode.com/2022/day/22)                      | [`OCaml`](#ocaml)       |
| 2022-12-23 | [Day 23: ](https://adventofcode.com/2022/day/23)                      | [`Matlab`](#matlab)     |
| 2022-12-24 | [Day 24: ](https://adventofcode.com/2022/day/24)                      | [`LISP`](#lisp)         |
| 2022-12-25 | [Day 25: ](https://adventofcode.com/2022/day/25)                      | [`clojure`](#clojure)   |


### Python 3

* https://www.python.org/doc/

```
# Install Python 3 on Arch Linux
sudo pacman -S python

# Run program
python myProgram.py
```


### Kotlin

* Used as Kotlin Script
* https://kotlinlang.org/docs/home.html
* https://selfformat.com/blog/2022/09/15/how-to-quickly-write-and-run-kotlin-script/

```
# Install Kotlin on Arch Linux
sudo pacman -S kotlin

# Run program
kotlinc -script myProgram.main.kts
```


### Go

* https://go.dev/

```
# Install Go on Arch Linux
sudo pacman -S go

# Run program
go run myProgram.go
```


### Rust

* https://www.rust-lang.org/

```
# Install Rust on Arch Linux
sudo pacman -S rust

# Compile and run program
rustc myProgram.rs 
./myProgram

# Use cargo as runner in separate folder
cd myProgram
cargo run
```


### C++

* https://cplusplus.com/doc/
* https://cppbyexample.com/

```
# Install LLVM toolchain on Arch Linux
sudo pacman -S clang lld lldb libc++

# Compile program
clang++ -Wall -std=c++20 myProgram.cpp -o myProgram

# Run program
./myProgram
```


### Scala

* Scala 3 was released in May 2021, but is incompatible with code written in Scala 2.x
* https://docs.scala-lang.org/tutorials/scala-for-java-programmers.html
* https://www.baeldung.com/scala/file-io#reading-from-a-file

```
# Install Scala on Arch Linux
sudo pacman -S scala

# Compile and run program
scalac MyProgram.scala
scala MyProgram

# Run program as script
scala MyProgram.scala
```


### Ruby

* https://www.ruby-lang.org
* https://www.rubyguides.com/2015/05/working-with-files-ruby/

```
# Install Ruby on Arch Linux
sudo pacman -S ruby

# Run program
ruby myProgram.rb
```


### Node.js

* https://nodejs.org/en/docs/

```
# Install Node.js on Arch Linux
sudo pacman -S nodejs

# Run program
node myProgram.js
```


### Elixir

* https://elixir-lang.org/getting-started/introduction.html

```
# Install Elixir and Erlang VM on Arch Linux
sudo pacman -S elixir

# Run program
elixir myProgram.exs
```


### Java

* https://cppbyexample.com/

```
# Install LLVM toolchain on Arch Linux
sudo pacman -S clang lld lldb libc++

# Compile program
clang++ -Wall -std=c++20 myProgram.cpp -o myProgram

# Run program
./myProgram
```

### PHP

* https://cppbyexample.com/

```
# Install LLVM toolchain on Arch Linux
sudo pacman -S clang lld lldb libc++

# Compile program
clang++ -Wall -std=c++20 myProgram.cpp -o myProgram

# Run program
./myProgram
```


### Haskell

* https://cppbyexample.com/

```
# Install LLVM toolchain on Arch Linux
sudo pacman -S clang lld lldb libc++

# Compile program
clang++ -Wall -std=c++20 myProgram.cpp -o myProgram

# Run program
./myProgram
```


### Bash

* https://cppbyexample.com/

```
# Install LLVM toolchain on Arch Linux
sudo pacman -S clang lld lldb libc++

# Compile program
clang++ -Wall -std=c++20 myProgram.cpp -o myProgram

# Run program
./myProgram
```


### Groovy

* https://cppbyexample.com/

```
# Install LLVM toolchain on Arch Linux
sudo pacman -S clang lld lldb libc++

# Compile program
clang++ -Wall -std=c++20 myProgram.cpp -o myProgram

# Run program
./myProgram
```


### C#

* https://cppbyexample.com/

```
# Install LLVM toolchain on Arch Linux
sudo pacman -S clang lld lldb libc++

# Compile program
clang++ -Wall -std=c++20 myProgram.cpp -o myProgram

# Run program
./myProgram
```


### R

* https://cppbyexample.com/

```
# Install LLVM toolchain on Arch Linux
sudo pacman -S clang lld lldb libc++

# Compile program
clang++ -Wall -std=c++20 myProgram.cpp -o myProgram

# Run program
./myProgram
```


### Swift

* https://cppbyexample.com/

```
# Install LLVM toolchain on Arch Linux
sudo pacman -S clang lld lldb libc++

# Compile program
clang++ -Wall -std=c++20 myProgram.cpp -o myProgram

# Run program
./myProgram
```


### Perl

* https://cppbyexample.com/

```
# Install LLVM toolchain on Arch Linux
sudo pacman -S clang lld lldb libc++

# Compile program
clang++ -Wall -std=c++20 myProgram.cpp -o myProgram

# Run program
./myProgram
```


### Fortran

* https://cppbyexample.com/

```
# Install LLVM toolchain on Arch Linux
sudo pacman -S clang lld lldb libc++

# Compile program
clang++ -Wall -std=c++20 myProgram.cpp -o myProgram

# Run program
./myProgram
```


### Lua

* https://cppbyexample.com/

```
# Install LLVM toolchain on Arch Linux
sudo pacman -S clang lld lldb libc++

# Compile program
clang++ -Wall -std=c++20 myProgram.cpp -o myProgram

# Run program
./myProgram
```


### Vala

* https://cppbyexample.com/

```
# Install LLVM toolchain on Arch Linux
sudo pacman -S clang lld lldb libc++

# Compile program
clang++ -Wall -std=c++20 myProgram.cpp -o myProgram

# Run program
./myProgram
```


### OCaml

* https://cppbyexample.com/

```
# Install LLVM toolchain on Arch Linux
sudo pacman -S clang lld lldb libc++

# Compile program
clang++ -Wall -std=c++20 myProgram.cpp -o myProgram

# Run program
./myProgram
```


### Matlab

* https://cppbyexample.com/

```
# Install LLVM toolchain on Arch Linux
sudo pacman -S clang lld lldb libc++

# Compile program
clang++ -Wall -std=c++20 myProgram.cpp -o myProgram

# Run program
./myProgram
```


### LISP

* https://cppbyexample.com/

```
# Install LLVM toolchain on Arch Linux
sudo pacman -S clang lld lldb libc++

# Compile program
clang++ -Wall -std=c++20 myProgram.cpp -o myProgram

# Run program
./myProgram
```


### clojure

* https://cppbyexample.com/

```
# Install LLVM toolchain on Arch Linux
sudo pacman -S clang lld lldb libc++

# Compile program
clang++ -Wall -std=c++20 myProgram.cpp -o myProgram

# Run program
./myProgram
```


## Credits

* https://www.99-bottles-of-beer.net for finding new programming languages and examples