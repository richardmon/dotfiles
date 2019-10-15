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
# Pyenv
export PATH="/home/richard/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Starship
eval "$(starship init zsh)"

# Aliases
alias ls='ls --color=auto'
alias flpass='lpass show -c --password $(lpass ls  | fzf | awk '"'"'{print $(NF)}'"'"' | sed '"'"'s/\]//g'"'"')'

#Fuzzy Search
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_COMPLETION_TRIGGER='~~'

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

