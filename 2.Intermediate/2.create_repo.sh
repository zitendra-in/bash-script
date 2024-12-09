#!/bin/bash

#################################################
# define functions

function create_repo() {
touch /etc/yum.repos.d/dvd_iso.repo
cat << EOF > /etc/yum.repos.d/dvd_iso.repo
[AppStream_DVD_ISO]
name=AppStream packages repository
baseurl=file:///mnt/Appstream
enabled=1
gpgcheck=1
gpgurl=file:///mnt/RPM-GPG-KEY-redhat-release

[BaseOS_DVD_ISO]
name=AppStream packages repository
baseurl=file:///mnt/BaseOS
enabled=1
gpgcheck=1
gpgurl=file:///mnt/RPM-GPG-KEY-redhat-release
EOF

yum repolist all

}

#################################################

echo -e "\nAttach DVD iso file."
mount /dev/sr0 /mnt

if [ -d /mnt/AppStream ]
then
	echo -e "\nDVD iso Successfully mounted in mnt directory."
	create_repo
else
	echo -e "\nDVD iso is not Attached"
	echo -e "\nAttach dvd iso file and run again"
fi
