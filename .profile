for file in ~/.{aliases,functions}; do
	# if file has read permissions and exists then source file
	[ -r "$file" ] && [ -f "$file" ] && source "$file";

    # Allow for local version overrides
    local="${file}.local"
	[ -r "$local" ]  && [ -f "$local" ] && source "$local";
done;
unset file;

# Source git completion if shell != zsh
if [[ -f ~/.git-completion.bash && -z "$ZSH_VERSION" ]]; then
  source ~/.git-completion.bash
fi

### Get os name via uname ###
_myos="$(uname)"

### setup aliases, etc per os
case $_myos in
   Linux) 
    eval `dircolors -b ~/dircolors-solarized/dircolors.ansi-light`
	;;
   Darwin) 
    eval `gdircolors -b ~/dircolors-solarized/dircolors.ansi-light`
	alias ls="gls"
	;;
   *) ;;
esac

# virtualenvwrapper
if [[ -f /usr/local/bin/virtualenv ]]; then
    export WORKON_HOME=$HOME/.virtualenvs   # Optional
    export PROJECT_HOME=$HOME/development     # Optional
    export VIRTUALENVWRAPPER_PYTHON="$(which python3)"
    export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
    source /usr/local/bin/virtualenvwrapper.sh
fi

# Source the ssh agent if found
if [ -f ~/.ssh-agent ]; then . ~/.ssh-agent; fi

# Source fzf if installed
if [[ -f ~/.fzf.zsh ]]; then
    source ~/.fzf.zsh
    export FZF_DEFAULT_OPTS='
        --bind="f2:toggle-preview,tab:execute(less {})"
        --preview "bat --style=numbers --color=always --line-range :500 {}"
        --preview-window=right:60%:hidden'
fi
