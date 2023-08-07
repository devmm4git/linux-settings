#!/bin/bash

# Update Platform
    sudo apt update && echo "       >> Updated System OK "

# Move temporal folder to download to download all packages.
    #cd /tmp

# Instalamos el OnlyOffice
    sudo apt install snapd
    sudo snap install onlyoffice-desktopeditors && echo "       >> OnlyOffice Installed  OK "

# Instalamos paqueteria de Software

    # + Instalamos la APP de extensiones 
    sudo apt install gnome-shell-extension-manager && echo "        >> Installed Extension Manager (APP) OK "

    # + Instalamos el tema obscuro
    sudo apt install gnome-tweaks   && echo "       >> Gnome-Tewaks Installed  OK "
    #wget https://web2.mm4.me/linux-tools-install/Arc-DarkestTheme.zip && echo "       >> Download Theme Installed  OK "
    sudo apt-get install unzip  && echo "       >> UNZIP Installed  OK "
    sudo mkdir ArchThemeFolder  && echo "       >> Folder Created OK "
    sudo unzip Arc-DarkestTheme.zip -d ArchThemeFolder/ && echo "       >> Unziped File  OK "
    cp -r /tmp/ArchThemeFolder /usr/share/themes/ && echo "       >> Listo para aplicar tema OK "

    # + Instalamos Thunderbird Mail 
    sudo install thunderbird  && echo "       >> Thunderbird Insalled OK "

    # + Instalamos Kitty. 
    sudo apt install kitty && echo "       >> Kitty Installed OK "
    sudo cp Broadcast.conf ~/.config/kitty/ && echo "       >> Downloaded Theme OK "
    sudo cp kitty.conf  ~/.config/kitty/    && echo "       >> Copied Kitty.conf OK "

    # + Install Visual Studio Code & Visual Studio Code Insiders
    sudo snap install --classic code

    # + Install MySQL Workbench
    sudo snap install mysql-workbench-community

    
    # + Install GitKraken 
    sudo wget https://release.gitkraken.com/linux/gitkraken-amd64.deb 
    sudo apt-get install ./gitkraken-amd64.deb && echo "       >>  GitKraken  Installed OK "

    # + Install LXD Containers
    # Follow these instructions : https://www.cyberciti.biz/faq/install-lxd-on-ubuntu-22-04-lts-using-apt-snap/
    # Setup SSH : 
    #             https://thucnc.medium.com/how-to-create-a-sudo-user-on-ubuntu-and-allow-ssh-login-20e28065d9ff
    #             https://phoenixnap.com/kb/ssh-permission-denied-publickey
    #             https://itslinuxfoss.com/resolve-ssh-permission-denied-publickey-error/
    
    sudo apt install lxd-installer      && echo "       >> LXD Containers Installed OK "
    sudo snap install lxd --channel=latest/stable
    sudo sudo lxd init      && echo "       >> LXD Setup OK "

        # Adding New rules to the bridge
        sudo ufw allow in on lxdbr0 comment 'lxdbr0 for LXD'
        sudo ufw route allow in on lxdbr0 comment 'lxdbr0 for LXD'
        sudo ufw route allow out on lxdbr0 comment 'lxdbr0 for LXD'
        echo "       >> LXD Rtules to the bridge added OK "

        # Ready to create first linux container
        sudo lxc launch ubuntu:18.04 base
        sudo lxc list
        echo "       >> LXD Fisrt Container Ready to Configure OK "

        # Create SSH publick Keys 

        # Configure SSH root in base container ( Dentro del contenedor )
            #sudo lxc exec base /bin/bash
            #sudo passwd     && echo " LXD Base Container root password Set OK "
            #sudo adduser dev0   
            #sudo usermod -aG sudo dev0 && echo "Base Container User Dev0 Added OK "
            # - Create .ssh folder
            #sudo mkdir ~/.ssh

            #exit 
        
        



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
echo "      -) Listo para aplicar tema :: (APP) Tweaks > Appearance > Applications > ArchThemeFolder "
echo "      -) Thunderbird Mail Instalado, agregar las extensiones Whats App, Tlegram,  "
echo "      -) Download BitWarden :: (APP) Ubuntu Software > Search Bitwarden or Google It"
echo "      -) Listo para Confifurar SSH LXD Container "
echo "      -) Instalar Visual Studio Code  "
echo "      -) Instalar Visual Studio Code Extensions :: https://marketplace.visualstudio.com/vscode "

read -p "Do you wish to Protect GRUB Boot Loader with Password (Y/N)? " yn
case $yn in
    [Yy]* ) 
            echo " Visit : https://www.cyberithub.com/how-to-password-protect-grub-boot-loader-in-ubuntu-20-04-lts/"
            continue;;
    [Nn]* ) 
esac