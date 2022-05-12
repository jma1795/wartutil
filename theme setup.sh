#Make Theme Directories if they don't exist
mkdir ~/.icons
mkdir ~/.themes

#Get Themes
echo '*****************Downloading Themes*****************'
cd ~/Downloads
git clone https://github.com/cbrnix/Newaita-reborn.git
git clone https://github.com/darkomarko42/Elemento.git

mkdir Bibata
cd ~/Downloads/Bibata
curl -L https://github.com/ful1e5/Bibata_Cursor/releases/download/v1.1.2/Bibata.tar.gz --output ~/Downloads/Bibata.tar.gz
tar -xf Bibata.tar.gz

cd ~/Downloads
git clone https://github.com/AdisonCavani/distro-grub-themes.git

echo '*****************Installing Themes*****************'
mv ~/Downloads/Newaita-reborn/* ~/.icons/ 
mv ~/Downloads/Bibata/* ~/.icons/ 
mv ~/Downloads/distro-grub-themes ~/
mv ~/Downloads/Elemento/* ~/.themes/

#Setting Themes
echo '*****************Attempting to Auto-setting Themes*****************'

gsettings set org.gnome.desktop.interface gtk-theme 'Elemento-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Origonal-Classic'
sudo flatpak override --filesystem=$HOME/.themes
gsettings set org.cinnamon.theme name 'Elemento-dark'
gsettings set org.cinnamon.desktop.interface gtk-theme "Elemento-dark"
gsettings set org.cinnamon.desktop.wm.preferences theme "Elemento-dark"
gsettings set org.cinnamon.desktop.interface icon-theme 'Newaita-reborn-dark'

#Cleanup
echo '*****************Cleaning up*****************'
rm -rf ~/Downloads/Newaita-reborn
rm -rf ~/Downloads/Elemento
rm -rf ~/Downloads/Bibata
rm -rf ~/Downloads/Bibata.tar.gz
echo '*****************DONE!*****************'
