#!/usr/bin/env bash

clear
##--------------------------------Functions used in the script--------------------------------##
#--Identify Distribution--#
declare -f VERIFY_DISTRIBUTION
function VERIFY_DISTRIBUTION()
{	INXI=`inxi -S`
	ID=`lsb_release -i`
	RELEASE=`lsb_release -r`
	if [[ $INXI = *Xfce* && "Distributor ID:	Debian" && ($RELEASE = "Release:	testing" || $RELEASE = "Release:	11") ]]; then
			inxi -S
			sleep 2s
			echo "#---System supported, installation will follow---------------------------------#"
			echo ""
			UPD
			BSPWM
			KSUPERKEY
			APPS
			APPS_XFCE
			PERSONAL
			PERSONAL_DEBIAN

		else	
			ERROR
			sleep 3
	fi
}

#--Function: Update system (base Debian)--#
declare -f UPD
function UPD(){
			echo "#---Update System--------------------------------------------------------------#"
				sudo apt update &&
			echo "#---Updated Repositories-------------------------------------------------------#"
			sleep 1s
				sudo apt upgrade -y &&
			echo "#---Updated Programs-----------------------------------------------------------#"
			sleep 1s

			sudo apt dist-upgrade -y && sudo apt autoclean && sudo apt autoremove -y &&
			echo "#---System updated-------------------------------------------------------------#"
				sleep 2s
			BSPWM
		}
		
			
#--Function: Install base BSPWM (base Debian)--#
declare -f BSPWM
function BSPWM()
	{
			echo "#---Installing BSPWM base------------------------------------------------------#"
				sudo apt install bspwm sxhkd rofi compton polybar light -y &&
			echo "#---BSPWM base installed-------------------------------------------------------#"
				sleep 2s
			APPS
	}
	

#--Function: Base Debian - Install ksuperkey (possibility to call Rofi with the super key)--#
declare -f KSUPERKEY
function KSUPERKEY()
	{
			echo "#---Enable ksuperkey-----------------------------------------------------------#"
			sudo apt install gcc make libx11-dev libxtst-dev pkg-config -y
			cd $HOME/Downloads && git clone https://github.com/hanschen/ksuperkey.git
			cd ksuperkey
			make
			sudo make install &&
			echo "#---Ksuperkey installed--------------------------------------------------------#"
				sleep 2s
	}


#--Function: Install companion apps (base Debian)--#
declare -f APPS
function APPS()
	{
			echo "#---Install add-on apps--------------------------------------------------------#"
			sudo apt install feh lxappearance dmenu xfconf xsettingsd xfce4-power-manager git i3lock gpick -y &&
			echo "#---Add-on apps installed------------------------------------------------------#"
				sleep 2s
			PERSONAL
	}


#--Function: Install companion apps for XFCE--#
declare -f APPS_XFCE
function APPS_XFCE()
	{
			echo "#---Install add-on apps for XFCE-----------------------------------------------#"
			sudo apt install catfish baobab -y
			sudo apt install language-selector-gnome -y &&
			echo "#---Add-on apps for XFCE installed---------------------------------------------#"
				sleep 2s
	}
	
	
#--Function: Use customizations for: fonts, configs, icons, themes, polybar, dunst and rofi--#
declare -f PERSONAL
function PERSONAL()
	{
			echo "#---Copy customizations (icons, themes, fonts)---------------------------------#"
				sudo chmod 755 $HOME/Downloads/alien-os_bspwm/fonts/* -R
				sudo cp -rf $HOME/Downloads/alien-os_bspwm/fonts/* /usr/share/fonts
				sudo cp -rf $HOME/Downloads/alien-os_bspwm/wallpaper/* /usr/share/backgrounds
				cp -rf $HOME/Downloads/alien-os_bspwm/home/config/* ~/.config
				sudo chmod +x ~/.config/bspwm/bin/askpass
				sudo chmod +x ~/.config/bspwm/bin/bspbar
				sudo chmod +x ~/.config/bspwm/bin/bspcolors
				sudo chmod +x ~/.config/bspwm/bin/bspcomp
				sudo chmod +x ~/.config/bspwm/bin/winmask
				sudo chmod +x ~/.config/bspwm/bspwmrc
				sudo chmod +x ~/.config/bspwm/rofi/bin/launcher
				sudo chmod +x ~/.config/bspwm/rofi/bin/powermenu
				sudo chmod +x ~/.config/bspwm/rofi/bin/powermenu.sh
				sudo chmod +x ~/.config/bspwm/rofi/bin/themes
				sudo chmod +x ~/.config/bspwm/rofi/bin/windows
				sudo chmod 777 ~/.config/bspwm/polybar/system
				mv $HOME/Downloads/alien-os_bspwm/home/Xresources.d $HOME/Downloads/alien-os_bspwm/home/.Xresources.d
				cp -rf $HOME/Downloads/alien-os_bspwm/home/.Xresources.d $HOME
				cp -rf $HOME/Downloads/alien-os_bspwm/home/.Xresources $HOME
				cp -rf $HOME/Downloads/alien-os_bspwm/home/.gtkrc-2.0 $HOME
				cp -rf $HOME/Downloads/alien-os_bspwm/home/.xsettingsd $HOME
				sudo cp -rf $HOME/Downloads/alien-os_bspwm/home/debian/apps_as_root.sh /usr/local/bin
				sudo chmod +x /usr/local/bin/apps_as_root.sh
				sudo cp -rf $HOME/Downloads/alien-os_bspwm/home/debian/nmd /usr/local/bin
				sudo chmod +x /usr/local/bin/nmd
				sudo cp -rf $HOME/Downloads/alien-os_bspwm/home/debian/askpass_rofi.sh /usr/local/bin
				sudo chmod +x /usr/local/bin/askpass_rofi.sh
				sudo chmod /sys/class/backlight/intel_backlight/ -R
				sudo chmod /sys/class/backlight/amdgpu_bl0/ -R
				
		
				# Copy themes
				cd $HOME/Downloads && git clone https://github.com/archcraft-os/archcraft-themes && chmod 755 archcraft-themes/* -R
				sudo cp -rf $HOME/Downloads/archcraft-themes/archcraft-gtk-theme-adapta/files/* /usr/share/themes
				sudo cp -rf $HOME/Downloads/archcraft-themes/archcraft-gtk-theme-arc/files/* /usr/share/themes
				sudo cp -rf $HOME/Downloads/archcraft-themes/archcraft-gtk-theme-blade/files/* /usr/share/themes
				sudo cp -rf $HOME/Downloads/archcraft-themes/archcraft-gtk-theme-cyberpunk/files/* /usr/share/themes
				sudo cp -rf $HOME/Downloads/archcraft-themes/archcraft-gtk-theme-dracula/files/* /usr/share/themes
				sudo cp -rf $HOME/Downloads/archcraft-themes/archcraft-gtk-theme-groot/files/* /usr/share/themes
				sudo cp -rf $HOME/Downloads/archcraft-themes/archcraft-gtk-theme-gruvbox/files/* /usr/share/themes
				sudo cp -rf $HOME/Downloads/archcraft-themes/archcraft-gtk-theme-hack/files/* /usr/share/themes
				sudo cp -rf $HOME/Downloads/archcraft-themes/archcraft-gtk-theme-juno/files/* /usr/share/themes
				sudo cp -rf $HOME/Downloads/archcraft-themes/archcraft-gtk-theme-kripton/files/* /usr/share/themes
				sudo cp -rf $HOME/Downloads/archcraft-themes/archcraft-gtk-theme-manhattan/files/* /usr/share/themes
				sudo cp -rf $HOME/Downloads/archcraft-themes/archcraft-gtk-theme-nordic/files/* /usr/share/themes
				sudo cp -rf $HOME/Downloads/archcraft-themes/archcraft-gtk-theme-rick/files/* /usr/share/themes
				sudo cp -rf $HOME/Downloads/archcraft-themes/archcraft-gtk-theme-spark/files/* /usr/share/themes
				sudo cp -rf $HOME/Downloads/archcraft-themes/archcraft-gtk-theme-sweet/files/* /usr/share/themes
				sudo cp -rf $HOME/Downloads/archcraft-themes/archcraft-gtk-theme-wave/files/* /usr/share/themes
				sudo cp -rf $HOME/Downloads/archcraft-themes/archcraft-gtk-theme-white/files/* /usr/share/themes
				sudo cp -rf $HOME/Downloads/archcraft-themes/archcraft-gtk-theme-windows/files/* /usr/share/themes
					
				# Copy system icons
				cd $HOME/Downloads && git clone https://github.com/archcraft-os/archcraft-icons && chmod 755 archcraft-icons/* -R
				sudo cp -rf $HOME/Downloads/archcraft-icons/archcraft-icons-arc/files/* /usr/share/icons
				sudo cp -rf $HOME/Downloads/archcraft-icons/archcraft-icons-breeze/files/* /usr/share/icons
				sudo cp -rf $HOME/Downloads/archcraft-icons/archcraft-icons-hack/files/* /usr/share/icons
				sudo cp -rf $HOME/Downloads/archcraft-icons/archcraft-icons-luna/files/* /usr/share/icons
				sudo cp -rf $HOME/Downloads/archcraft-icons/archcraft-icons-luv/files/* /usr/share/icons
				sudo cp -rf $HOME/Downloads/archcraft-icons/archcraft-icons-nordic/files/* /usr/share/icons
				sudo cp -rf $HOME/Downloads/archcraft-icons/archcraft-icons-numix/files/* /usr/share/icons
				sudo cp -rf $HOME/Downloads/archcraft-icons/archcraft-icons-papirus/files/* /usr/share/icons
				sudo cp -rf $HOME/Downloads/archcraft-icons/archcraft-icons-qogir/files/* /usr/share/icons
				sudo cp -rf $HOME/Downloads/archcraft-icons/archcraft-icons-white/files/* /usr/share/icons
				sudo cp -rf $HOME/Downloads/archcraft-icons/archcraft-icons-win11/files/* /usr/share/icons
				sudo cp -rf $HOME/Downloads/archcraft-icons/archcraft-icons-zafiro/files/* /usr/share/icons &&

			echo "#---Customizations copied------------------------------------------------------#"
	}
	
	
#--Function: Debian xfce specific customization--#
declare -f PERSONAL_DEBIAN
function PERSONAL_DEBIAN()
	{
			clear
			echo "#---Copy customizations--------------------------------------------------------#"
				cp -rf $HOME/Downloads/alien-os_bspwm/home/debian/.fehbg $HOME
				#cp -rf $HOME/Downloads/alien-os_bspwm/home/debian/Thunar/ ~/.config
				cp -rf $HOME/Downloads/alien-os_bspwm/home/debian/sxhkd/ ~/.config
				mkdir ~/.config/neofetch
				cp -rf $HOME/Downloads/alien-os_bspwm/home/debian/config.conf ~/.config/neofetch
				cp -rf $HOME/Downloads/alien-os_bspwm/home/debian/powermenu ~/.config/bspwm/rofi/bin
				sudo chmod +x ~/.config/bspwm/rofi/bin/powermenu
				cp -rf $HOME/Downloads/alien-os_bspwm/home/debian/powermenu.rasi ~/.config/bspwm/rofi/themes
				sudo cp -rf $HOME/Downloads/alien-os_bspwm/home/debian/nordico.png /usr/share/images/desktop-base/ &&
				#sudo cp -rf $HOME/Downloads/alien-os_bspwm/home/debian/lightdm-gtk-greeter.conf /etc/lightdm/ &&
			echo "#---Customizations copied------------------------------------------------------#"
				sleep 3s
			clear
			SUCCESS
	}


#--Function: Notify operation success--#
declare -f SUCCESS
function SUCCESS()
	{
		echo "-== Installation successful! For everything to work correctly, it is recommended that you restart your PC. ==-"
	}
	
#--Function: Notify Operation Failure--#
declare -f ERROR
function ERROR()
	{
		clear
		echo "#-----------------------------------Unsupported system--------------------------------------#"
		echo "#----------------This script was developed to run on the following distros:.----------------#"		
		echo "#-------------------------Debian Bullseye or Bookworm (XFCE or Gnome)-----------------------#"
		echo "#---If you are using one of the mentioned ones, it is necessary to have 'inxi' installed----#"
	}
		
##--------------------------------Functions used in the script--------------------------------##
	clear
		echo "#---This wizard will install BSPWM on your machine-----------------------------#"
	VERIFY_DISTRIBUTION