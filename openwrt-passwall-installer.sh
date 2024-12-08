#!/bin/sh

# Update package list
opkg update

# Remove dnsmasq and install dnsmasq-full
opkg remove dnsmasq
opkg install dnsmasq-full

# Install required kernel modules
opkg install kmod-nft-tproxy kmod-nft-socket kmod-nft-nat

# Download and add Passwall public key
wget -O passwall.pub https://master.dl.sourceforge.net/project/openwrt-passwall-build/passwall.pub
opkg-key add passwall.pub

# Set up custom feeds for Passwall with major version only
read arch << EOF
$(. /etc/openwrt_release ; echo $DISTRIB_ARCH)
EOF
release=$(. /etc/openwrt_release ; echo $DISTRIB_RELEASE | cut -d'.' -f1,2)

for feed in passwall_packages passwall2; do
  echo "src/gz $feed https://master.dl.sourceforge.net/project/openwrt-passwall-build/releases/packages-$release/$arch/$feed" >> /etc/opkg/customfeeds.conf
done

# Update package list to include new feeds
opkg update

# Install Passwall2
opkg install luci-app-passwall2
