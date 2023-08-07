#!/bin/bash
    

    read -p "Install LXD Containers (Y/N)? " yn
    case $yn in
        [Yy]* )  
                sudo apt install lxd-installer      && echo "       >> LXD Containers Installed OK "
                sudo snap install lxd --channel=latest/stable
                sudo sudo lxd init      && echo "       >> LXD Setup OK "
            
                    # Adding New rules to the bridge
                    sudo ufw allow in on lxdbr0 comment 'lxdbr0 for LXD'
                    sudo ufw route allow in on lxdbr0 comment 'lxdbr0 for LXD'
                    sudo ufw route allow out on lxdbr0 comment 'lxdbr0 for LXD'
                    echo "       >> LXD Rtules to the bridge added OK "
            
                    # Ready to create first linux container
                    echo "       >> LXD Containers is Ready :)  "
                    echo "----------------------------------------------------------------------------"
                    echo "                                                                   "

        continue;;
        [Nn]* ) 
    esac
    
    # + Setup LXD Contenedor Base
    read -p "Do you wish to Launch Base Container (Y/N)?" yn
    case $yn in
        [Yy]* ) 

                # - Generate SSH Public Keys
                    sudo ssh-keygen -t rsa      && echo "SSH Public Key generated OK "
                    xclip -sel c /root/.ssh/id_rsa.pub && echo "SSH Public Key Copied to Clipboard OK "
                    echo " ----------------------------------------------------------- "
                

                # - Create a new LXD Container 
                    # Ready to create first linux container
                    sudo lxc launch ubuntu:18.04 base
                    sudo lxc list
                    echo "       >> LXD Fisrt Container Ready to Configure OK "
                    echo "----------------------------------------------------------------------------"

                # - Configuramos el LXD Base 
                    
                    sudo lxc start base
                    echo "      >> Arrancando LXD Contenedor Base .... "
                    sleep 5
                    sudo lxc exec base -- apt update
                    sudo lxc exec base -- apt install apache2   && echo "       >> LAMP Installed OK"
                    echo "----------------------------------------------------------------------------"
                    sudo lxc exec base --  sudo adduser ubu
                    sudo lxc exec base --  usermod -aG sudo ubu && echo "       >> UBU User Created OK"
                    echo "----------------------------------------------------------------------------"
                    sudo lxc file push /root/.ssh/id_rsa.pub base/tmp/
                    sudo lxc exec base -- cat /tmp/id_rsa.pub >> ~/.ssh/authorized_keys && echo "       >> SSH Public Key Copy OK"
                    echo "----------------------------------------------------------------------------"
                    sudo lxc file push sshd_config base/etc/ssh/ && echo "       >> sshd_config file copied OK"
                    echo "----------------------------------------------------------------------------"
                    sudo lxc exec base -- apt install openssh-server && echo "       >> OpenSSH-Server Installed OK"
                    echo "----------------------------------------------------------------------------"
                    sudo lxc exec base -- systemctl restart sshd && echo "       >> SSH Restarted OK"
                    sudo lxc stop base
                    echo "      >> Reseteando LXD Contenedor Base .... "
                    sleep 3
                    sudo lxc start base
                    sleep 5
                    echo "----------------------------------------------------------------------------"
                    echo "      >> SSH log In ubu@<IP-address> "

                    
            continue;;
        [Nn]* ) 
    esac
