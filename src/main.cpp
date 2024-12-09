#include <iostream>
#include <string>
#include <cstring>
#include <stdexcept>

#include "vigenere-cipher.hpp"

int main(int argc, char *argv[]) {
    if (argc <= 2) {
        std::cout   << "Vigenère Cipher Tools - v1.0.0" << std::endl
                    << "Usage:" << std::endl
                    << "    vigenere encrypt [key] [text]" << std::endl
                    << "    vigenere decrypt [key] [text]" << std::endl;
        return 0;
    }

    const std::string key = argv[2];
    for (char c : key) {
        if (!std::isalpha(c)) {
            throw std::invalid_argument("The key must consist only of letters.");
        }
    }

    if (std::strcmp(argv[1], "encrypt") == 0) {
        if (argc == 4) {
            std::string text = argv[3];
            vigenere::encrypt(text, key);
            std::cout << text << std::endl;
        } else if (argc == 3) {
            vigenere::encrypt_stream(std::cin, std::cout, key);
        }
    } else if (std::strcmp(argv[1], "decrypt") == 0) {
        if (argc == 4) {
            std::string text = argv[3];
            vigenere::decrypt(text, key);
            std::cout << text << std::endl;
        } else if (argc == 3) {
            vigenere::decrypt_stream(std::cin, std::cout, key);
        }
    } else {
        std::cerr << "Invalid command. Use 'encrypt' or 'decrypt'." << std::endl;
    }

    return 0;
}
