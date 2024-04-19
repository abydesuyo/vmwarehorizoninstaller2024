#!/bin/sh


#Download this "https://customerconnect.vmware.com/en/downloads/info/slug/desktop_end_user_computing/vmware_horizon_clients/horizon_8"
#Download this "https://download3.vmware.com/software/CART25FQ1_LIN64_2312.1/VMware-Horizon-Client-2312.1-8.12.1-23543969.x64.bundle"

DOWNLOAD="https://download3.vmware.com/software/CART25FQ1_LIN64_2312.1/VMware-Horizon-Client-2312.1-8.12.1-23543969.x64.bundle"

echo "cd $HOME/Downloads"
cd $HOME/Downloads
#rm VMware-Horizon-Client-2312.1-8.12.1-23543969.x64.bundle
rm -rf VMware-Horizon-Client*
echo "Lets try downloading... $DOWNLOAD"
wget $DOWNLOAD
chmod +x VMware-Horizon-Client-2312.1-8.12.1-23543969.x64.bundle
echo "removing old installations"
sudo rm -rf /etc/vmware*
sudo rm -rf $HOME/.vmware/*
sudo rmdir $HOME/.vmware
sudo steamos-readonly disable
sudo ./VMware-Horizon-Client-2312.1-8.12.1-23543969.x64.bundle --console --required --eulas-agreed
THEME=`kreadconfig5 --key LookAndFeelPackage`
sudo sed -i "s/Exec=vmware-view %u/Exec=env GTK_THEME=$THEME vmware-view %u/g" /usr/share/applications/vmware-view.desktop
sudo steamos-readonly enable
echo "Done installing"

