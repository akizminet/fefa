# fefa

My custom Fedora Silverblue [bootc](https://github.com/bootc-dev/bootc) image.

## Overview
This image is based on `ghcr.io/ublue-os/silverblue-main:latest` and tailored for my specific workstation needs.

### Key Customizations
- **VPN Support**: Includes `openvpn3-client`.
- **Core Components**: Installs the `antigravity` package.
- **De-bloated**: Firefox is removed by default.

## Usage

### Switch to this image
If you are already on a bootc-compatible system, you can switch to this image by running:
```bash
sudo bootc switch ghcr.io/akizminet/fefa:latest
```

## Documentation
- [Build and Template Guide](./BUILD.md) - Refer here for building ISOs, setting up signing keys, and general template instructions.
- [Justfile Documentation](./BUILD.md#justfile-documentation) - Commands for local builds and VM testing.
