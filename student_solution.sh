#!/bin/bash

# SELinux Access Denial Practical
# Student Name:HASAN MOHAMMRDS
# Register Number:1U24IT041

echo "===== SELinux Status ====="
getenforce
sestatus


echo "===== Creating Web Directory ====="
sudo mkdir -p /webdata


echo "===== Creating HTML File ====="
sudo touch /webdata/index.html
echo "SELinux Practical" | sudo tee /webdata/index.html > /dev/null


echo "===== Setting Linux Permissions ====="
sudo chmod 755 /webdata
sudo chmod 644 /webdata/index.html


echo "===== Checking Initial Context ====="
ls -Zd /webdata
ls -Z /webdata/index.html


echo "===== Assigning Wrong SELinux Context ====="
sudo chcon -t user_home_t /webdata/index.html


echo "===== Checking Wrong Context ====="
ls -Z /webdata/index.html


echo "===== Checking AVC Denials ====="
sudo ausearch -m AVC -ts recent


echo "===== Correcting SELinux Context ====="
sudo restorecon -v /webdata/index.html


echo "===== Checking Correct Context ====="
ls -Z /webdata/index.html


echo "===== Practical Completed ====="
