#!/bin/bash
# setup-java.sh
# Run with: bash setup-java.sh

echo "=== Java JDK 21 Installer for Mac/Linux ==="

# Detect OS
OS="$(uname -s)"

# 1. Install JDK depending on OS
if [ "$OS" = "Darwin" ]; then
    # macOS
    if ! command -v brew &> /dev/null; then
        echo "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    echo "Installing OpenJDK 21..."
    brew install openjdk@21

    # Set JAVA_HOME
    echo 'export JAVA_HOME=$(/usr/libexec/java_home -v 21)' >> ~/.zshrc
    echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.zshrc
    source ~/.zshrc

elif [ "$OS" = "Linux" ]; then
    # Linux
    if command -v apt &> /dev/null; then
        sudo apt update
        sudo apt install -y openjdk-21-jdk
    elif command -v dnf &> /dev/null; then
        sudo dnf install -y java-21-openjdk
    else
        echo "Unsupported Linux distribution. Please install OpenJDK 21 manually."
        exit 1
    fi

    # Set JAVA_HOME
    echo 'export JAVA_HOME=/usr/lib/jvm/java-21-openjdk' >> ~/.bashrc
    echo 'export PATH=$JAVA_HOME/bin:$PATH' >> ~/.bashrc
    source ~/.bashrc
else
    echo "Unsupported OS: $OS"
    exit 1
fi

# 2. Test
java -version
javac -version

echo "=== Installation Completed! ==="
