# Git Some Repositories 
cd ~/Downloads && mkdir 'Git Clone' || cd ~/Downloads/'Git Clone'/ && xargs -L1 git clone <<EOF
https://aur.archlinux.org/brave-bin.git
https://aur.archlinux.org/alacritty-colorscheme.git
https://aur.archlinux.org/cutycapt-qt5-git.git
EOF

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install Necessary Packages
sudo pacman -S neovim kitty alacritty i3 python blanket git htop 

# Install Necessary Python Packages 
sudo pip install pillow beautifulsoup4 sklearn numpy pandas matplotlib ueberzug 
