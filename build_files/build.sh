#!/bin/bash

set -ouex pipefail

### Repository Configuration

# Add Antigravity custom repository (keep disabled by default)
dnf5 config-manager addrepo --id="antigravity-custom" --set=baseurl="https://us-central1-yum.pkg.dev/projects/antigravity-auto-updater-dev/antigravity-rpm" 
# Add Google Chrome repository
dnf5 config-manager addrepo --id="google-chrome-custom" --set=baseurl="http://dl.google.com/linux/chrome/rpm/stable/x86_64"

dnf5 config-manager setopt *-custom*.enabled=0
dnf5 config-manager setopt *-custom*.gpgcheck=0


# Enable OpenVPN3 COPR
dnf5 -y copr enable dsommers/openvpn3

### Package Management

# Remove unwanted packages
dnf5 remove -y firefox

mkdir -p /usr/lib/google && ln -sf /usr/lib/google /opt/google
# Install core packages
dnf5 install -y --setopt=*-custom*.enabled=1 \
    openvpn3-client \
    antigravity \
    google-chrome-stable

# Disable COPR after installation
dnf5 -y copr disable dsommers/openvpn3
