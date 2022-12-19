# Git Some Repositories 
# cd ~/Downloads && mkdir 'Git Clone' || cd ~/Downloads/'Git Clone'/ && xargs -L1 git clone <<EOF
# https://aur.archlinux.org/brave-bin.git
# https://aur.archlinux.org/alacritty-colorscheme.git
# https://aur.archlinux.org/cutycapt-qt5-git.git
# EOF


# Install Necessary Packages
sudo pacman -S neovim kitty alacritty i3 python blanket git htop pavucontrol lazygit flameshot nemo exa bat ncdu fd tldr zathura

# Install Yay & Stuff
cd ~/Downloads && mkdir 'Git Clone' || cd ~/Downloads/'Git Clone'/ && xargs -L1 git clone <<EOF
https://aur.archlinux.org/yay-git.git
https://github.com/AstroNvim/AstroNvim ~/.config/nvim
https://github.com/capsaicinoids/astronvim_config.git
https://github.com/eendroroy/alacritty-theme.git
EOF 

cd ~/Downloads/Git\ Clone/yay-git && makepkg -si
cp ~/Downloads/Git\ Clone/astronvim_config/init.lua ~/.config/nvim/lua/user
cp ~/Downloads/Git\ Clone/astronvim_config/config ~/.config/i3
nvim +PackerSync

# Instal AUR Packages
yay -S brave-bin alacritty-colorscheme droidcam brightness-controller-git visual-studio-code-bin -y

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# Install Necessary Python Packages 
sudo pip install pillow beautifulsoup4 sklearn numpy pandas matplotlib ueberzug 
