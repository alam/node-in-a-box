# Description

Sick of JavaScript being weaponized on your system? Well worry no more. Use
this docker-ized version of Node.js (Yarn included inside) and lay your concerns
to rest.

# Prerequisites

1. \*nix based system (sorry Windows users).
2. Docker installed locally.

# Installing

Run the provided `install.sh`. And follow the post-installation instructions. If
you missed them then here they are:

```plaintext
Add the following line to your .profile or .bash_profile to load the proxy
binaries and then reload your shell:

    [ -d "$HOME/.yarn/bin" ] && PATH="$HOME/.yarn/bin":$PATH
    [ -d "$HOME/bin" ] && PATH="$HOME/bin":$PATH'
```

# Uninstalling

Run the provided `uninstall.sh`. And follow the post-installation instructions.

# Usage

Call `node` or `yarn` as you normally would from your command line. You can also
run the node debugger with `node-debug`. No special syntax is needed... unless
you want to access a port in the container. In that case you will have to map
the ports you want.

## Mapping Ports

### macOS

The macOS version of Docker does not support the host network mode. As such, you
must explicitly define which ports you want to map. You do this by setting the
`PORTS` environment variable.

For example, if you wanted to map internal port 80 to external port 3000 you
would run the following:

```bash
PORTS=3000:80 node server.js
```

### Linux

With Linux you have two options, you can explicitly map the ports you want as
shown in the "macOS" section, or you can enable host networking. Host networking
shares the ports in the container with the host. Be careful when using this as
it gives the process in the container access to services running on your host's
ports.

To enable host networking, set the `NETWORK`environment variable to `host`:

```bash
NETWORK=host node server.js
```

# License

MIT licensed. See `LICENSE.md` file for details.
