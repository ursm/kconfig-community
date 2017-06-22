# kconfig-community

A collection of useful kernel configurations provided by the community.

## Prerequisites

- `sys-devel/gettext` (for `envsubst` command)

## Installation

```
$ sudo make install
```

Please re-emerge `sys-kernel/gentoo-sources` in order to patch the kernel source after the initial installation.

## Usage

If you run `make nconfig` (or your favorite subcommand) in the kernel source directory, you will see an excellent menu item at the top level.

## License

MIT
