#!/bin/bash
 
# This is a script I use to setup MySQL on ramdisk
# after I need to reboot.  This assumes that you already
# have MySQL installed and have previously moved your
# MySQL files to a backup location, e.g.:
# mv /var/lib/mysql /home/cgallemore/workspace/mysql
 
stop mysql
 
mkdir /tmp/ramdisk
mount -t tmpfs -o size=256M tmpfs /tmp/ramdisk/
 
unlink /var/lib/mysql
cp -pRL /home/cgallemore/workspace/mysql /tmp/ramdisk/mysql
ln -s /tmp/ramdisk/mysql/ /var/lib/mysql
 
chmod -R 700 /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql
 
start mysql
