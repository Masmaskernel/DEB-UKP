#!/bin/bash

apt update
apt install apache2 isc-dhcp-server -y
mv interfaces /etc/network/interfaces
cp -r satria /var/www/satria
cp -r fresto /var/www/fresto
cp sites-available/fresto.conf /etc/apache2/sites-available/fresto.conf
cp sites-available/satria.conf /etc/apache2/sites-available/satria.conf
sudo su
a2ensite fresto.conf
a2ensite satria.conf
systemctl reload apache2
exit
cp dhcp/dhcp.conf /etc/dhcp/dhcpd.conf
systemctl restart networking
