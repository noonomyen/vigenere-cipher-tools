# Vigenère Cipher Tools

Vigenère Cipher Tools is a simple CLI utility for encrypting and decrypting text using the **Vigenère Cipher**. It provides a quick and easy way to work with encrypted messages directly from your terminal. The tool supports plaintext, numbers, and symbols.

## Installation

To build and install the tool, follow these steps:

```bash
git https://github.com/noonomyen/vigenere-cipher-tools.git
cd vigenere-cipher-tools
make build
sudo make install
```

This will copy the vigenere binary to /usr/local/bin, making it accessible globally on your system.

### Uninstallation

To remove the installed binary, run:

```bash
sudo make uninstall
```

## Usage

```text
Vigenère Cipher Tools - v1.0.0
Usage:
    vigenere encrypt [key] [text]
    vigenere decrypt [key] [text]
```

### Examples

Encrypting a message

```bash
vigenere encrypt abc "hello"
# Output: hfnlp
```

Decrypting a message

```bash
vigenere decrypt abc "hfnlp"
# Output: hello
```

Using with stdin

```bash
echo "hello" | vigenere encrypt abc
# Output: hfnlp

echo "hfnlp" | vigenere decrypt abc
# Output: hello
```

Encrypting and decrypting text with special characters

```bash
echo "hello{world_123}" | vigenere encrypt abcdef | vigenere decrypt abcdef
# Output: hello{world_123}
```

## Notes

- Key must consist of English letters only (A-Z, a-z).
- Text supports letters, numbers, and common symbols.
