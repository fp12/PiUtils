# changed default password
passwd

# mandatory utils for distrib updates
sudo -s
resize_rootfs.sh
pine64_update_kernel.sh
pine64_update_uboot.sh
reboot

# update everything
sudo -s
apt-get update
apt-get upgrade -y && apt-get dist-upgrade -y
reboot
