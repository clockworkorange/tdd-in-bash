#!/bin/bash dry-wit

function can_read_input_file_test() {
    local result
    Assert.functionExists "can_read_input_file" "function can_read_input_file not exist";

    createTempFile;
    cat <<EOF > ${RESULT}
+1
+5
EOF
    can_read_input_file ${RESULT}
    result="${RESULT}"
    Assert.areEqual "$result" "6" "result not is 6"
}

function shift_frequency_exist_test() {
    Assert.functionExists "shift_frequency" "function shift_frequency not exist";
}

function shift_frequency_test() {
    local result
    RESULT='';
    shift_frequency "+3"
    result="${RESULT}"
    Assert.isTrue $? "shift_frequency is false"
    Assert.isNotEmpty "$result" "fail is not empty"
    Assert.areEqual "$result" "3" "result not is 3"
    shift_frequency "+2"
    result="${RESULT}"
    Assert.isTrue $? "shift_frequency is false"
    Assert.isNotEmpty "$result" "fail is not empty"
    Assert.areEqual "$result" "5" "result not is 5"
    shift_frequency "-8"
    result="${RESULT}"
    Assert.isTrue $? "shift_frequency is false"
    Assert.isNotEmpty "$result" "fail is not empty"
    Assert.areEqual "$result" "-3" "result not is -3"
}

function increment_frequency_test() {
    local result
    RESULT='';
    increment_frequency "3"
    result="${RESULT}"
    Assert.areEqual "$result" "3" "result not is 3"
    increment_frequency "2"
    result="${RESULT}"
    Assert.areEqual "$result" "5" "result not is 5"
}

function decrement_frequency_test() {
    local result
    RESULT='';
    decrement_frequency "3"
    result="${RESULT}"
    Assert.areEqual "$result" "-3" "result not is -3"
    decrement_frequency "2"
    result="${RESULT}"
    Assert.areEqual "$result" "-5" "result not is -5"
}

function test_setup() {
    reset
}