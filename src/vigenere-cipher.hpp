#ifndef VIGENERE_CIPHER_HPP
#define VIGENERE_CIPHER_HPP

#include <string>
#include <cstdint>
#include <iostream>

namespace vigenere {
    void encrypt(std::string& plaintext, const std::string& key);
    void encrypt_stream(std::istream& in, std::ostream& out, const std::string& key);

    void decrypt(std::string& ciphertext, const std::string& key);
    void decrypt_stream(std::istream& in, std::ostream& out, const std::string& key);
}

#endif /* VIGENERE_CIPHER_HPP */
