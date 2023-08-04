#!/bin/bash

# Update Platform
    sudo apt update && echo "       >> Updated System OK "

# Move temporal folder to download to download all packages.
    cd /tmp

# Instalamos el OnlyOffice
    sudo apt install snapd
    sudo snap install onlyoffice-desktopeditors && echo "       >> OnlyOffice Installed  OK "

# Instalamos paqueteria de Software

    # + Instalamos la APP de extensiones 
    sudo apt install gnome-shell-extension-manager && echo "        >> Installed Extension Manager (APP) OK "

    # + Instalamos el tema obscuro
    sudo apt install gnome-tweaks   && echo "       >> Gnome-Tewaks Installed  OK "
    wget https://web2.mm4.me/linux-tools-install/Arc-DarkestTheme.zip && echo "       >> Download Theme Installed  OK "
    sudo apt-get install unzip  && echo "       >> UNZIP Installed  OK "
    sudo mkdir ArchThemeFolder  && echo "       >> Folder Created OK "
    sudo unzip Arc-DarkestTheme.zip -d ArchThemeFolder/ && echo "       >> Unziped File  OK "
    cp -r /tmp/ArchThemeFolder /usr/share/themes/ && echo "       >> Listo para aplicar tema OK "


    # + Instalamos BitWarden. 
    #   .... Download From Ubuntu Software (APP)

    # + Protect GRUB Boot Loader with Password
    #   -- https://www.cyberithub.com/how-to-password-protect-grub-boot-loader-in-ubuntu-20-04-lts/


    





#Mostramos las ultimas indicaciones para instalar manualmente. 

echo "                                                                   "
echo " ----------------------------------------------------------------- "
echo "      Instalaciones Manuales (Extras) "
echo " ----------------------------------------------------------------- "
echo "      1) Agregar Awsome Titles && Disable Ubuntu Dock :: (APP) Extension Manager "
echo "      2) Listo para aplicar tema :: (APP) Tweaks > Appearance > Applications > ArchThemeFolder "
echo "      4) Download BitWarden :: (APP) Ubuntu Software > Search Bitwarden or Google It"

read -p "Do you wish to Protect GRUB Boot Loader in Ubuntu with Password (Y/N)? " yn
case $yn in
    [Yy]* ) 
            echo " Visit : https://www.cyberithub.com/how-to-password-protect-grub-boot-loader-in-ubuntu-20-04-lts/"
            continue;;
    [Nn]* ) 
esac