# TERMINAL
export TERMINAL="st"

# Add Binaries to Path
for element in /home/richard/.machine/*
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

# Aliases
alias ls='ls --color=auto'

