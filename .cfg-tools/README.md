# dotfiles-tools
A list of installation commands / scripts to aid in bootstrapping a system.

## Bootstrap Linux
### Install optional packages
```bash
sudo apt-get update -qq > /dev/null
sudo apt-get install -qq \
    build-essential \
    curl \
    git \
    vim \
    fzf \
    zsh \
    rsync \
    python3.9 \
    python3-pip \
    ripgrep \
    ssh > /dev/null
sudo pip3 install virtualenvwrapper -qq > /dev/null
```

### Install Brew
```bash
sudo apt update
sudo apt-get install build-essential
sudo apt install git -y
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" >> ${HOME}/.zshrc
```

# Bootstrap Mac
## Brew
```bash
#!/usr/bin/env bash

#################################################
#   Install command-line tools using Homebrew   #
#################################################

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install gnu-sed
brew install coreutils

brew install gawk
brew install wget
brew install ripgrep
brew install bat
brew install jq
brew install fzf
brew install xmlsec1
brew install node
brew install tree
brew install starship
brew install csvkit

# dbeaver
brew install --cask dbeaver-community
brew install --cask adoptopenjdk

# Cask applications
brew install --cask virtualbox
brew install --cask spotify
brew install --cask burp-suite
brew install --cask meld

# Docker
brew install docker
brew install docker-compose
brew install docker-machine

# Remove outdated versions from the cellar.
brew cleanup
```

# SSH
## Configuration
```bash
mkdir $(HOME)/.ssh && chmod 700 ~/.ssh
touch ${HOME}/.ssh/authorized_keys && chmod 600 ${HOME}/.ssh/authorized_keys
chmod 644 ~/.ssh/config
ssh-keygen -t rsa -b 4096 && printf "\n\n\033[32mPublic key (add to github)\033[0m\n" && cat ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa
```

## .ssh/config example
Starter ssh configuration that is used on most of my bootstrapped environments
```bash
Host *
  ServerAliveInterval 60
  ServerAliveCountMax 300

Host dougie-fresh.xyz dougie-desktop
  User dougie
  IdentityFile "~/.ssh/id_rsa_dougiedesktop"
  Port 2222

Host github.com
  IdentityFile ~/.ssh/id_rsa_github
```

# Additional setup

## fzf / bat
install / configure fzf and bat
* [fzf](https://github.com/junegunn/fzf) command-line fuzzy finder
* [bat](https://github.com/sharkdp/bat) `cat` clone with syntax highlighting

### Installation
#### Linux
```bash
sudo apt-get install -qq fzf bat
```

*Note:* If installed with apt the install for `bat` might be called `batcat`.  This can be addressed as follows:
```
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
```

#### Mac
```bash
brew install bat
brew install fzf
```

#### Alternative installation
```bash
# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ${HOME}/.fzf
${HOME}/.fzf/install

# install bat
wget -O bat.tar.gz https://github.com/sharkdp/bat/releases/download/v0.18.3/bat-v0.18.3-x86_64-unknown-linux-musl.tar.gz
mkdir bat && tar -xzvf bat.tar.gz -C bat --strip-components=1
rm ${HOME}/bat.tar.gz
```

## oh-my-zsh

### Zplug
```bash
zplug update
```


## Robotomono
Download robotomono
```bash
curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/RobotoMono.zip --output ${HOME}/RobotoMono.zip
```
