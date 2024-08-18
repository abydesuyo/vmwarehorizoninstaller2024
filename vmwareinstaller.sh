#!/bin/sh


#Download this "https://customerconnect.vmware.com/en/downloads/info/slug/desktop_end_user_computing/vmware_horizon_clients/horizon_8"
#Download this "https://download3.vmware.com/software/CART25FQ1_LIN64_2312.1/VMware-Horizon-Client-2312.1-8.12.1-23543969.x64.bundle"

#DOWNLOAD="https://download3.vmware.com/software/CART25FQ1_LIN64_2312.1/VMware-Horizon-Client-2312.1-8.12.1-23543969.x64.bundle"
#20240818 revision
if [ ! -f  ./VMWARE-LOCATION ]; then
	DOWNLOAD="https://download3.vmware.com/software/CART25FQ2_LIN64_2406/VMware-Horizon-Client-2406-8.13.0-9995429239.x64.bundle"
else
	DOWNLOAD=`cat ./VMWARE-LOCATION`
fi
INSTALLER=`echo $DOWNLOAD | awk -F"/" '{print $NF}' `

echo "cd $HOME/Downloads"
cd $HOME/Downloads
#rm VMware-Horizon-Client-2312.1-8.12.1-23543969.x64.bundle
rm -rf VMware-Horizon-Client*
echo "Lets try downloading... $DOWNLOAD"
exit
wget $DOWNLOAD
chmod +x $INSTALLER
echo "removing old installations"
sudo rm -rf /etc/vmware*
sudo rm -rf $HOME/.vmware/*
sudo rmdir $HOME/.vmware
sudo steamos-readonly disable
sudo ./$INSTALLER  --console --required --eulas-agreed
THEME=`kreadconfig5 --key LookAndFeelPackage`
sudo sed -i "s/Exec=vmware-view %u/Exec=env GTK_THEME=$THEME vmware-view %u/g" /usr/share/applications/vmware-view.desktop
sudo steamos-readonly enable
echo "Done installing"

