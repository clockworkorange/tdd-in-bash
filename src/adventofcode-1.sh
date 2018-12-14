#!/bin/bash dry-wit

function can_read_input_file() {
    local -a input_file=();
    mapfile -t input_file < $1
    for ((line=0;line<${#input_file[*]};line++)); do
        shift_frequency ${input_file[${line}]}
    done
}

function shift_frequency() {
    if startsWith "$1" "+" ; then
        removePrefix "$1" "+"
        increment_frequency "$RESULT";
    elif startsWith "$1" "-"; then
        removePrefix "$1" "-"
        decrement_frequency "$RESULT"
    fi
}

function increment_frequency() {
    FREQUENCY=$((FREQUENCY+$1))
    export RESULT=${FREQUENCY}
}

function decrement_frequency() {
    FREQUENCY=$((FREQUENCY-$1))
    export RESULT=${FREQUENCY}
}

function reset() {
    FREQUENCY=0
}

declare -gx FREQUENCY #-g global -x export

function main() {
    logInfo -n "Calculating frequency..."
    env
    echo $FILE
    can_read_input_file "$FILE"
    logInfoResult SUCCESS "${RESULT}"
}

setScriptDescription "test"
addCommandLineFlag "file" "f" "a file" MANDATORY EXPECTS_ARGUMENT