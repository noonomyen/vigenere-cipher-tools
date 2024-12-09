#include <string>
#include <algorithm>
#include <iostream>
#include <stdexcept>

#include "vigenere-cipher.hpp"

void vigenere::decrypt(std::string& text, const std::string& key) {
    if (key.empty()) {
        throw std::logic_error("Key cannot be empty.");
    }

    size_t i = 0;

    for (char& c : text) {
        if (std::islower(c)) {
            c = ((c - std::tolower(key[i]) + 26) % 26) + 'a';
        } else if (std::isupper(c)) {
            c = ((c - std::toupper(key[i]) + 26) % 26) + 'A';
        } else {
            continue;
        }

        i = (i + 1) % key.size();
    }
}

void vigenere::decrypt_stream(std::istream& in, std::ostream& out, const std::string& key) {
    if (key.empty()) {
        throw std::logic_error("Key cannot be empty.");
    }

    size_t i = 0;
    char c;

    while (in.get(c)) {
        if (std::islower(c)) {
            out.put(((c - std::tolower(key[i]) + 26) % 26) + 'a');
        } else if (std::isupper(c)) {
            out.put(((c - std::toupper(key[i]) + 26) % 26) + 'A');
        } else {
            out.put(c);
            continue;
        }

        i = (i + 1) % key.size();
    }
}
