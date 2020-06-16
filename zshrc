# TERMINAL
export TERMINAL="kitty"

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
    alias ls="exa"
    alias ll="exa -l"
fi
if [-e ~/.cargo/bin/bat]; then
    alias cat="bat"
    alias oldcat="cat"
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
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$HOME/.go_path

# Scripts
alias focus="sudo bash $HOME/dotfiles/server.sh $@"

