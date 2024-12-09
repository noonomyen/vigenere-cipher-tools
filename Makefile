CXX := g++
CXXFLAGS := -std=c++17 -Wall -Wextra -O2

SRCS := src/decrypt.cpp src/encrypt.cpp src/main.cpp
OBJS := $(SRCS:.cpp=.o)
TARGET := vigenere

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) $(OBJS) -o $(TARGET)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

all: clean build

build: $(TARGET)

clean:
	rm -f $(TARGET) $(OBJS)

install: $(TARGET)
	install -m 755 $(TARGET) /usr/local/bin/$(TARGET)

uninstall:
	rm -f /usr/local/bin/$(TARGET)

test:
	@echo "Running tests..."
	./test.sh

.PHONY: build
