# dotfiles-tools
A list of installation commands / scripts to aid in bootstrapping a system.

# Bootstrap Linux
## Install optional packages
```bash
sudo apt-get update 
sudo apt-get install \
    build-essential \
    curl \
    git \
    vim \
    zsh \
    rsync \
    python3.9 \
    python3-pip \
    ripgrep \
    ssh
sudo pip3 install virtualenvwrapper -qq > /dev/null
```

## Install Brew
```bash
sudo apt update
sudo apt-get install build-essential
sudo apt install git -y
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" >> ${HOME}/.zshrc
```

# Bootstrap Mac
## Brew
1. Install [Brew](https://brew.sh/)
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install packages using brew
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
brew install jq
brew install xmlsec1
brew install node
brew install tree
brew install csvkit
brew install yamllint

# dbeaver
brew install --cask dbeaver-community
brew install --cask adoptopenjdk

# Cask applications
brew install --cask virtualbox
brew install --cask spotify
brew install --cask burp-suite
brew install --cask meld

# Fix mouse / trackpad scrolling
brew install --cask unnaturalscrollwheels

# Docker
brew install docker
brew install docker-compose
brew install docker-machine

# Remove outdated versions from the cellar.
brew cleanup
```

# Additional setup
## SSH
### Configuration
```bash
mkdir $(HOME)/.ssh && chmod 700 ~/.ssh
touch ${HOME}/.ssh/authorized_keys && chmod 600 ${HOME}/.ssh/authorized_keys
chmod 644 ~/.ssh/config
ssh-keygen -t rsa -b 4096 && printf "\n\n\033[32mPublic key (add to github)\033[0m\n" && cat ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa
```

### .ssh/config example
Starter ssh configuration that is used on most of my bootstrapped environments
```bash
cat >> ${HOME}/.ssh/config <<EOF
Host *
  ServerAliveInterval 60
  ServerAliveCountMax 300

Host dougie-fresh.xyz dougie-desktop
  User dougie
  IdentityFile "~/.ssh/id_rsa_dougiedesktop"
  Port 2222

Host github.com
  IdentityFile ~/.ssh/id_rsa_github
EOF
```

## Setting up zsh

### Install oh-my-zsh
[documentation](https://ohmyz.sh/)
1. Install oh-my-zsh
```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

2. Change shell to `zsh` if not already done
```bash
chsh -s /usr/bin/zsh
```

3. Update `~/.zshrc`
```bash
cat >> ${HOME}/.zshrc <<EOF

###############
# Zplug setup #
###############
if [[ ! -d ~/.zplug ]]; then
  #git clone https://github.com/zplug/zplug ~/.zplug
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
  source ~/.zplug/init.zsh && zplug update --self
fi

source ~/.zplug/init.zsh

zplug "plugins/git",   from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Load themes
zplug 'dracula/zsh', as:theme
#zplug romkatv/powerlevel10k, as:theme, depth:1

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

####################
# Additional setup #
####################
export DEFAULT_USER=`whoami`" >> ${HOME}/.zshrc
[[ -f "${HOME}/.profile" ]] && source ${HOME}/.profile >> ${HOME}/.zshrc

EOF
```

### Install Zplug
1. Install [zplug](https://github.com/zplug/zplug) plugin manager for zsh

*preferred method*
```bash
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
```
*Alternate method*
```bash
brew install zplug
```

2. Add zplug sourcing to `{$HOME}/.zshrc`
```bash
echo "[ -f ~/.zplug.zsh ] && source ~/.zplug.zsh" >> ${HOME}/.zshrc
```

3. Load plugins (not required)
```bash
zplug load
```

## fzf / bat
* [fzf](https://github.com/junegunn/fzf) command-line fuzzy finder
* [bat](https://github.com/sharkdp/bat) `cat` clone with syntax highlighting

1. Install using `brew`
```bash
brew install bat
brew install fzf
```

*Alternate method*
```bash
# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ${HOME}/.fzf
${HOME}/.fzf/install

# install bat
wget -O bat.tar.gz https://github.com/sharkdp/bat/releases/download/v0.18.3/bat-v0.18.3-x86_64-unknown-linux-musl.tar.gz
mkdir bat && tar -xzvf bat.tar.gz -C bat --strip-components=1
rm ${HOME}/bat.tar.gz
```

## starship
Installation of [starship](https://starship.rs/) prompt.

1. Install using `brew`
```bash
brew install starship
```

2. Add starship init to zshrc
```bash
eval "$(starship init zsh)" >> ~/.zshrc
```

## Robotomono
Download robotomono
```bash
curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/RobotoMono.zip --output ${HOME}/RobotoMono.zip
```
