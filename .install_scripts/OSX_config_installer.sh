!#/bin/bash
# 17.10.2024
# delale@MacMini
#
# Intsallation for OSX

# BREW
# Install homebrew and commandlinetools
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install tilining window manager (Amethyst)
brew install --cask amethyst

# install eza (better less)
brew install eza

# install bat
brew install bat

# install soundtools
brew install ffmpeg
brew install exiftool

# LANGUAGE SUPPORT
# miniconda3 installation
mkdir -p $HOME/miniconda3
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.ch -o $HOME/miniconda3/miniconda.sh
bash $HOME/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm $HOME/miniconda3/miniconda.sh
# miniconda setup
conda config --set changeps1 False

# R
brew install r
conda install -c conda-forge radian

# TODO: install zsh plugins, config repo, neovim setup
