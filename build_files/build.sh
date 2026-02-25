#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1
dnf5 config-manager addrepo --set=baseurl="https://us-central1-yum.pkg.dev/projects/antigravity-auto-updater-dev/antigravity-rpm" --id="antigravity-custom"
dnf5 -y copr enable dsommers/openvpn3
dnf5 config-manager setopt *-custom*.enabled=0
dnf5 config-manager setopt *-custom*.gpgcheck=0
# this installs a package from fedora repos

dnf5 install -y --setopt=*-custom*.enabled=1 openvpn3-client antigravity
dnf5 remove -y firefox
dnf5 -y copr disable dsommers/openvpn3
