#!/bin/bash

# update bash prompt just in case #
echo 'export PS1="\[\e[33m\]\A\[\e[m\] \[\e[34m\]\u\[\e[m\]\[\e[37m\]@\[\e[m\]\[\e[31m\]\h\[\e[m\] \[\e[32m\]\w\[\e[m\]\n\[\e[31m\]\\$\[\e[m\] "' > ~/.bashrc

# install homebrew #
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# set up zsh #
  # set zsh as default shell
  chsh -s /bin/zsh

  # install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  # install zsh plugins #
    # install zsh completions
    brew install zsh-completions

    # install zsh auto suggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    # install zsh syntax highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  # ------------------- #

  # fix git branch to not pipe to less
  git config --global pager.branch false
# ---------- #

# install starship prompt #
  # clone the project
  sudo git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"

  # symlink the clone to zsh themes
  ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

  # change zshrc ZSH_THEME to "spaceship"
  cp ./zsh-config/.zshrc ~/.zshrc
# ----------------------- #

# install & setup neovim #
  brew install neovim
  # make a config file structure
  mkdir ~/.config
  mkdir ~/.config/nvim
  # copy the prepared config file there
  cp ./vim-config/init.vim ~/.config/nvim/init.vim

  # install vim plug
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  # prompt user to install the plugins
  echo 'please run :PlugInstall on next neovim run'
# ---------------------- #

# install neofetch #
  brew install neofetch
  # add the behaviour to zsh startup
  echo "add neofetch to zsh startup? (y/n)"
  read nf_start
  if [[ $nf_start == "Y" || $nf_start == "y" ]]; then
    echo "
## Startup ##
neofetch

##
" >> ~/.zshrc
  fi
