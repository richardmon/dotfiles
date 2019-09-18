set -g -x fish_greeting ''

eval (starship init fish)

set PATH $PATH /home/richard/.bin/
for val in (ls -d ~/.bin/*/)
        set PATH $PATH $val/
        set PATH $PATH $val/bin/
end
set PATH $PATH /usr/local/go/bin/
set PATH $PATH $HOME/.go/bin/

set GOPATH $HOME/.go/
set GOPATH $GOPATH $HOME/Documents/golang/

function nvm
        bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

set -xU TERMINAL "gnome-terminal"
set -xU NVIM_GTK_NO_HEADERBAR 1
set -xU NVIM_GTK_NO_WINDOW_DECORATION 1
alias code="nvim-gtk"

set -x PYENV_ROOT $HOME/.pyenv
set -x PATH $PYENV_ROOT/bin $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)

alias cat="bat"
