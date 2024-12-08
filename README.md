# Passwall Setup Script for OpenWrt

This script automates the installation of the `Passwall2` package on OpenWrt, which provides support for VPN and proxy services, alongside some necessary kernel modules and DNS configurations.

## Prerequisites

- OpenWrt must be installed and running on your device.
- The device should have network access to download packages from external sources.
- This script assumes you are running a supported version of OpenWrt.

## Script Breakdown

1. **Update Package List**  
   The script starts by updating the list of available packages using `opkg update`.

2. **Remove dnsmasq and Install dnsmasq-full**  
   It removes the default `dnsmasq` package and installs `dnsmasq-full` for improved DNS and DHCP functionality.

3. **Install Kernel Modules**  
   The required kernel modules (`kmod-nft-tproxy`, `kmod-nft-socket`, and `kmod-nft-nat`) are installed to support network traffic proxying and NAT.

4. **Download Passwall Public Key**  
   The script downloads the Passwall public key and adds it to the system’s trusted keys using `opkg-key add`.

5. **Setup Custom Feeds for Passwall**  
   It sets up the necessary custom feeds for Passwall using the current OpenWrt version and architecture.

6. **Install Passwall2**  
   Finally, the script installs `lucI-app-passwall2`, which provides the user interface for managing Passwall configurations.

## Usage

1. **Download the Script**  
   Upload the script to your OpenWrt device via SSH or any other method you prefer.

    ```bash
    wget https://raw.githubusercontent.com/kasun-97/openwrt-passwall-installer/refs/heads/master/openwrt-passwall-installer.sh
    ```
2. **Execute the Script Executable**  
   Run the following command to make the script executable:

   ```bash
   sh openwrt-passwall-installer.sh
   ```
  
3. **Access Passwall2**
   Once the installation is complete, you can access the Passwall2 web interface through LuCI at:
   ```
   http://<your-router-ip>/cgi-bin/luci/admin/services/passwall2
   ```
   

