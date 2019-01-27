#!/usr/bin/env bash

# Setup some convenience variables for text formatting.

BOLD="\033[1m"
CLEAR="\033[0m"

# Delete the Docker image.

echo -e "Removing Docker image for node-in-a-box.\n"

[ -n "$(docker image ls -q node-in-a-box:latest)" ] && \
    docker image rm -f node-in-a-box:latest && \
    echo ""

# Remove Yarn folders from the host.

echo -e "Removing user-specific Yarn folders on host.\n"

rm -rf "$HOME/.config/yarn"
rm -rf "$HOME/.yarn"

# Remove the binary proxies.

echo -e "Removing binary proxies."

for file in ./bin-proxies/*; do
    bin_proxy_path="$HOME/bin/${file##*/}"
    [ -e "$bin_proxy_path" ] && rm -f "$bin_proxy_path"
done

# Print post-installation instructions.

echo -e $BOLD
echo "Post-Uninstallation Instructions"
echo "================================"
echo -e $CLEAR
echo "Remove the following lines to your .profile or .bash_profile:"
echo ""
echo '    [ -d "$HOME/.yarn/bin" ] && PATH="$HOME/.yarn/bin":$PATH'
echo '    [ -d "$HOME/bin" ] && PATH="$HOME/bin":$PATH'
echo ""
