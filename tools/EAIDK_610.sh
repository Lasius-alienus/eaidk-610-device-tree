#!/bin/sh

#来自极术社区url=https://aijishu.com/a/1060000000242322

main()
{
	if [ ! -d /etc/yum.repos.d.backup ];then
		cd /etc/
		sudo cp yum.repos.d/ yum.repos.d.backup -r
		echo "backup complete"
	else
		echo "no need to backup yum.repo.d"
	fi

	cd /etc/yum.repos.d/
	
	if [ -e /etc/yum.repos.d/openailab.repo ];then
		sudo rm /etc/yum.repos.d/openailab*
		echo "rm openailab* ok"
	else
		echo "no need to delete openailab*"
	fi

	if [ -e /etc/yum.repos.d/rockchip.repo ];then
		sudo rm /etc/yum.repos.d/rockchip*
		echo "rm rockchip* ok"
	else
		echo "no need to delete rockchip*"
	fi

	fileList=`ls`

	for i in $fileList
	do
		sed -i "s/baseurl=http:\/\/www.eaidk.net\/fedora/baseurl=https:\/\/archives.fedoraproject.org\/pub\/archive\/fedora\/linux/g" $i
		sed -i "s/baseurl=http:\/\/219.139.34.182\/fedora/baseurl=https:\/\/archives.fedoraproject.org\/pub\/archive\/fedora\/linux/g" $i
	done

	sudo yum localinstall --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-28.noarch.rpm
	sudo yum localinstall --nogpgcheck http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-28.noarch.rpm

	sudo dnf clean all
	sudo dnf makecache
}



main
