# vmwarehorizoninstaller2024
Attempt to install vmware latest Horizon client on steamdeck running update Steam OS as of April 2024.

Disclaimer

Use at your own risk. This is something intended only to be run on steamdeck os in an Konsole to install Horizon Client. This is not intended for other Linux distributions. Hard coded to use the current distribution of Horizon client as of April 19, 2024. You can obviously change it in the script for getting the latest distro if you know the direct download link. 


Pre-requisites

- wget (sudo apt install wget -y)
- a sudo password is required
- git (optional, as you can just copy paste the script to a random file)


Installation

This is what I recommend doing:
- Open Konsole
- mkdir $HOME/installers 
- cd ~/installers
- git clone git@github.com:abydesuyo/vmwarehorizoninstaller2024.git
- cd vmwarehorizoninstaller2024
- chmod +x vmwareinstaller.sh
- ./vmwareinstaller.sh
When prompted for your sudo password, key it in once
