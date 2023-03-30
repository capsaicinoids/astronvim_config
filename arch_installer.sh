#!/bin/bash

# Install Necessary Packages
sudo pacman -S --noconfirm --needed neovim kitty alacritty hyprland python blanket git htop pavucontrol lazygit flameshot nemo exa bat ncdu fd ack df procs  tldr zathura termshark vlc vifm httpie rsync diff-so-fancy

# Install Yay & Clone Repositories
mkdir -p ~/Downloads/Git_Clone
cd ~/Downloads/Git_Clone

repos=(
    "https://aur.archlinux.org/yay-git.git"
    "https://github.com/AstroNvim/AstroNvim.git"
    "https://github.com/capsaicinoids/astronvim_config.git"
    "https://codeberg.org/JustineSmithies/hyprland-dotfiles.git"
)

for repo in "${repos[@]}"; do
    git clone "$repo"
done

# Build and Install Yay
cd yay-git
makepkg -si --noconfirm

# Copy Configuration Files
mkdir -p ~/.config/nvim/lua/user
cp ../astronvim_config/init.lua ~/.config/nvim/lua/user

# Run PackerSync in Neovim
nvim +PackerSync +qa

# Install AUR Packages
yay -S --noconfirm --needed brave-bin droidcam brightness-controller-git visual-studio-code-bin

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install Cloned Repositories
cd ~/Downloads/Git_Clone

install_steps=(
    "" # No installation steps for yay-git, already installed
    "cp -r AstroNvim ~/.config/nvim" # Install AstroNvim
    "cp -r hyprland-dotfiles/.config/hyprland ~/.config" # Apply hyprland config
)

for i in "${!install_steps[@]}"; do
    if [ -n "${install_steps[$i]}" ]; then
        repo_name=$(basename "${repos[$i]}" .git)
        cd "$repo_name"
        eval "${install_steps[$i]}"
        cd ..
    fi
done
