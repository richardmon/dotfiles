# TERMINAL
export TERMINAL="kitty"
export EDITOR="nvim"

# Add Binaries to Path
for element in /home/richard/.bin/*
do
        if [ -f $element ]; then # If is a dir
                export PATH=$PATH:$element
        elif [ -d $element ]; then
                export PATH=$PATH:$element/:$element/bin/
        fi
done
export PATH=$PATH:/home/richard/.bin/

# XAMPP
export PATH=$PATH:/opt/lampp/bin
### Kitty
export PATH=$PATH:/home/richard/.bin/kitty-0.19.3/kitty/launcher

# Pyenv
export PATH="/home/richard/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Stack
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
eval "$(stack --bash-completion-script stack)"

# Starship
eval "$(starship init zsh)"

# Aliases
alias flpass='lpass show -c --password $(lpass ls  | fzf | awk '"'"'{print $(NF)}'"'"' | sed '"'"'s/\]//g'"'"')'
if [ -e ~/.cargo/bin/exa ]; then
    alias ls="exa --color auto --icons"
    alias ll="exa --color auto --icons -s type -lh"
    alias la="exa --color auto --icons -a -s type -lah"
fi
if [ -e ~/.cargo/bin/bat ]; then
    alias oldcat="cat"
    alias cat="bat"
fi

#Fuzzy Search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_COMPLETION_TRIGGER='~~'

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# GOLANG
export GOPATH=$HOME/.go_path
export PATH=$PATH:$(go env GOPATH)/bin

# Scripts
alias focus="sudo bash $HOME/dotfiles/server.sh $@"


# NNN
n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

export NNN_PLUG='f:finder;o:fzopen;v:preview-tui'
export NNN_FIFO=/tmp/nnn.fifo
alias icat="kitty +kitten icat"
