#!/usr/bin/env bash

# Setup some convenience variables for text formatting.

BOLD="\033[1m"
CLEAR="\033[0m"

# Build the Docker image.

echo -e "Building Docker image for node-in-a-box.\n"

. ./build.sh && \
    echo ""

# Create required folders on the host and copy over the binary proxies.

echo -e "Creating user-specific binary and Yarn folders on host.\n"

mkdir -p "$HOME/.config/yarn"
mkdir -p "$HOME/.yarn"
mkdir -p "$HOME/bin"

echo -e "Copying binary proxies over.\n"

cp -f ./bin-proxies/* "$HOME/bin"

# Print post-installation instructions.

echo -e $BOLD
echo "Post-Installation Instructions"
echo "=============================="
echo -e $CLEAR
echo "Add the following lines to your .profile or .bash_profile to load the proxy"
echo "binaries and then reload your shell:"
echo ""
echo '    [ -d "$HOME/.yarn/bin" ] && PATH="$HOME/.yarn/bin":$PATH'
echo '    [ -d "$HOME/bin" ] && PATH="$HOME/bin":$PATH'
echo ""
