# Functions removed from .zshrc. Kept here to source it whenever needed.

# Building single c, cpp, go, rust files
function bp() {
    if [ -z $1 ]; then
        echo "Usage: bp [FILE] [OPTIONS]\nBuilds single C, C++, Go and Rust files"

    else
        var=$1
        num=${#1}
        if [[ $var == *".cpp" ]]; then
            let "num-=4"
            g++ -std=c++14 $1 -o ${var:0:$num} $2 $3 $4 $5
        elif [[ $var == *".c" ]]; then
            let "num-=2"
            gcc $1 -o ${var:0:$num} $2 $3 $4 $5
        elif [[ $var == *".go" ]]; then
            go build $1 $2 $3 $4 $5
        elif [[ $var == *".rs" ]]; then
            rustc $1 $2 $3 $4 $5
        else
            echo "Error: Unrecognised file type"
        fi
    fi
}

# Building + running single c, cpp, go, rust files
function rp() {
    if [ -z $1 ]; then
        echo "Usage: rp [FILE] [OPTIONS]\nBuilds & runs, or directly runs single C, C++, Go, Rust files"
    else
        var=$1
        num=${#1}
        if [[ $var == *".cpp" ]]; then
            let "num-=4"
            exe=${var:0:$num}
            g++ -std=c++14 $var -o $exe $2 $3 $4 $5
            ./$exe
        elif [[ $var == *".c" ]]; then
            let "num-=2"
            exe=${var:0:$num}
            gcc $var -o $exe $2 $3 $4 $5
            ./$exe
        elif [[ $var == *".go" ]]; then
            go run $var $2 $3 $4 $5
        elif [[ $var == *".rs" ]]; then
            let "num-=3"
            rustc $var $2 $3 $4 $5 && ./${var:0:$num}
        else
            echo "Error: Unrecognised file type"
        fi
    fi
}
