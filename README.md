# Advent of Code

https://adventofcode.com/2022/


## Programming languages

|**day** |**language**|
|:-------|:-----------|
| 01.12. | `Python 3` |
| 02.12. | `Kotlin`   |
| 03.12. | `Go`       |
| 04.12. | `Rust`     |
| 05.12. | `C++`      |
| 06.12. | `Scala`    |
| 07.12. | `Ruby`     |
| 08.12. | `Node.js`  |
| 09.12. | `Elixr`    |
| 10.12. | `Java 19`  |
| 11.12. | `PHP`      |
| 12.12. | `Haskell`  |
| 13.12. | `Bash`     |
| 14.12. | `Groovy`   |
| 15.12. | `C#`       |
| 16.12. | `R`        |
| 17.12. | `Swift`    |
| 18.12. | `Perl`     |
| 19.12. | `Fortran`  |
| 20.12. | `Lua`      |
| 21.12. | `Vala`     |
| 22.12. | `OCaml`    |
| 23.12. | `Matlab`   |
| 24.12. | `LISP`     |
| 25.12. | `clojure`  |


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

# Compile program
rustc myProgram.rs 

# Run program
./myProgram

# Using cargo
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


## Credits

* https://www.99-bottles-of-beer.net for finding new programming languages and examples