set -g -x fish_greeting ''

set -x -U PATH $PATH /home/richard/.bin/
for val in (ls -d ~/.bin/*/)
        set -gx PATH $PATH $val
        set -gx PATH $PATH "$val""bin/"
end
set -gx PATH $PATH $HOME/.local/bin/

set -gx PATH $PATH $HOME/.cargo/bin/

set -x -U PATH $PATH /usr/local/go/bin/
set -x -U PATH $PATH $HOME/.go/bin/

set GOPATH $HOME/.go/
set GOPATH $GOPATH $HOME/Documents/golang/


function nvm
        bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

eval (starship init fish)

set -xU NVIM_GTK_NO_HEADERBAR 1
set -xU NVIM_GTK_NO_WINDOW_DECORATION 1
alias code="nvim-gtk"

set PYENV_ROOT $HOME/.pyenv
set PATH $PYENV_ROOT/bin $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and . (pyenv virtualenv-init -|psub)

set -gx TERMINAL "kitty"
