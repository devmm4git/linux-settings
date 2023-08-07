#!/bin/bash


# Update Platform
    sudo apt update && echo "       >> Updated System OK "
    sudo apt install net-tools
    echo "----------------------------------------------------------------------------"

# Move temporal folder to download to download all packages.
    #cd /tmp

# Instalamos el OnlyOffice
    sudo apt install snapd
    sudo snap install onlyoffice-desktopeditors && echo "       >> OnlyOffice Installed  OK "
    echo "----------------------------------------------------------------------------"

# Instalamos paqueteria de Software

    # + Instalamos la APP de extensiones 
    sudo apt install gnome-shell-extension-manager && echo "        >> Installed Extension Manager (APP) OK "
    echo "----------------------------------------------------------------------------"
    
    # + Instalamos el tema obscuro
    sudo apt install gnome-tweaks   && echo "       >> Gnome-Tewaks Installed  OK "
    #wget https://web2.mm4.me/linux-tools-install/Arc-DarkestTheme.zip && echo "       >> Download Theme Installed  OK "
    sudo apt-get install unzip  && echo "       >> UNZIP Installed  OK "
    sudo mkdir ArchThemeFolder  && echo "       >> Folder Created OK "
    sudo unzip Arc-Darkest-Theme.zip  -d ArchThemeFolder/ && echo "       >> Unziped File  OK "
    sudo pwd
    sudo cp -r ArchThemeFolder /usr/share/themes/ && echo "       >> Listo para aplicar tema OK "
    echo "----------------------------------------------------------------------------"
    
    # + Instalamos Thunderbird Mail 
    sudo apt-get install thunderbird  && echo "       >> Thunderbird Insalled OK "
    echo "----------------------------------------------------------------------------"

    # + Instalamos Kitty. 
    sudo apt install kitty && echo "       >> Kitty Installed OK "
    homedir=$( getent passwd "$USER" | cut -d: -f6 )
    echo "Copy Kitty Settings File to ---> "${homedir}/.config/kitty/
    sudo cp Broadcast.conf ${homedir}/.config/kitty/ && echo "       >> Downloaded Theme OK "
    sudo cp kitty.conf  ${homedir}/.config/kitty/    && echo "       >> Copied Kitty.conf OK "
    echo "----------------------------------------------------------------------------"

    # + Install Visual Studio Code & Visual Studio Code Insiders
    sudo snap install --classic code && echo "       >> Visual Studio Code Installed OK "
    echo "----------------------------------------------------------------------------"

    # + Install MySQL Workbench
    sudo snap install mysql-workbench-community && echo "       >> MySQL WorkBench OK "
    echo "----------------------------------------------------------------------------"
    
    # + Install GitKraken 
    sudo wget https://release.gitkraken.com/linux/gitkraken-amd64.deb 
    sudo apt-get install ./gitkraken-amd64.deb && echo "       >>  GitKraken  Installed OK "
    echo "----------------------------------------------------------------------------"
    
    # + Install LXD Containers
    # Follow these instructions : https://www.cyberciti.biz/faq/install-lxd-on-ubuntu-22-04-lts-using-apt-snap/
    # Setup SSH : 
    #             https://thucnc.medium.com/how-to-create-a-sudo-user-on-ubuntu-and-allow-ssh-login-20e28065d9ff
    #             https://phoenixnap.com/kb/ssh-permission-denied-publickey
    #             https://itslinuxfoss.com/resolve-ssh-permission-denied-publickey-error/

    sudo sh setup-lxdContainers.sh

    # + Instalamos BitWarden. 
    #   .... Download From Ubuntu Software (APP)

    # + Protect GRUB Boot Loader with Password
    #   -- https://www.cyberithub.com/how-to-password-protect-grub-boot-loader-in-ubuntu-20-04-lts/

    
    





#Mostramos las ultimas indicaciones para instalar manualmente. 

echo "                                                                   "
echo " ----------------------------------------------------------------- "
echo "      Instalaciones Manuales (Extras) "
echo " ----------------------------------------------------------------- "
echo "      -) Agregar Awsome Titles && Disable Ubuntu Dock :: (APP) Extension Manager "
echo "      -) Aplicar tema :: (APP) Tweaks > Appearance > Applications > ArchThemeFolder "
echo "      -) Download BitWarden :: (APP) Ubuntu Software > Search Bitwarden or Google It"
echo "      -) Programas Instalados : Thunderbir, MySQL WorkBench, GitKraken, Visual Studio Code, Kitty "
echo "      -) Instalar Visual Studio Code Extensions :: https://marketplace.visualstudio.com/vscode "
echo "                                                                   "

read -p "Do you wish to Protect GRUB Boot Loader with Password (Y/N)? " yn
case $yn in
    [Yy]* ) 
            echo " Visit : https://www.cyberithub.com/how-to-password-protect-grub-boot-loader-in-ubuntu-20-04-lts/"
            continue;;
    [Nn]* ) 
esac
