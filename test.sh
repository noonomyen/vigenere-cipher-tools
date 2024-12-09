#!/bin/bash

run_test_args() {
    local key="$1"
    local plaintext="$2"

    local ciphertext=$(./vigenere encrypt "$key" "$plaintext")
    local decryptedtext=$(./vigenere decrypt "$key" "$ciphertext")

    if [[ "$decryptedtext" == "$plaintext" ]]; then
        echo "ARG Test Passed"
        echo "    Key        : $key"
        echo "    Plaintext  : $plaintext"
        echo "    Ciphertext : $ciphertext"
        echo "    Decrypted  : $decryptedtext"
    else
        echo "ARG Test Failed"
        echo "    Key        : $key"
        echo "    Plaintext  : $plaintext"
        echo "    Ciphertext : $ciphertext"
        echo "    Decrypted  : $decryptedtext"
        exit 1
    fi
}

run_test_stdin() {
    local key="$1"
    local plaintext="$2"

    local ciphertext=$(echo "$plaintext" | ./vigenere encrypt "$key")
    local decryptedtext=$(echo "$ciphertext" | ./vigenere decrypt "$key")

    if [[ "$decryptedtext" == "$plaintext" ]]; then
        echo "STDIN Test Passed"
        echo "    Key        : $key"
        echo "    Plaintext  : $plaintext"
        echo "    Ciphertext : $ciphertext"
        echo "    Decrypted  : $decryptedtext"
    else
        echo "STDIN Test Failed"
        echo "    Key        : $key"
        echo "    Plaintext  : $plaintext"
        echo "    Ciphertext : $ciphertext"
        echo "    Decrypted  : $decryptedtext"
        exit 1
    fi
}

generate_random_key() {
    local length="$1"
    tr -dc 'A-Za-z' </dev/urandom | head -c "$length"
}

generate_random_input() {
    local length="$1"
    local charset='A-Za-z0-9!@#$%^&*()_+[]{};:,.<>?/ '
    tr -dc "$charset" </dev/urandom | head -c "$length"
}

run_test_args "abc" "hello"
run_test_args "key" "test123"
run_test_args "secure" "special_chars_!@#"
run_test_args "password" "flag{this_is_secret1234}"
run_test_args "secure" "1234567890&*()$"
run_test_args "vigenere" "1234567890!@#$%^&*()"
run_test_args "longkey" "abcdefghijklmnopqrstuvwxyz"

run_test_stdin "abc" "hello"
run_test_stdin "key" "test123"
run_test_stdin "secure" "special_chars_!@#"
run_test_stdin "password" "flag{this_is_secret1234}"
run_test_stdin "secure" "1234567890&*()$"
run_test_stdin "vigenere" "1234567890!@#$%^&*()"
run_test_stdin "longkey" "abcdefghijklmnopqrstuvwxyz"

echo "Running 10 random byte tests with spaces included"
for i in {1..10}; do
    random_key=$(generate_random_key 16)
    random_input=$(generate_random_input 64)

    echo "Random Test $i"
    run_test_args "$random_key" "$random_input"
    run_test_stdin "$random_key" "$random_input"
done

echo "All tests completed successfully."
