if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias ls="eza"
alias l="eza -lah --git"
alias cat="bat"

# cd-to-repo aliases
alias backend="cd ~/src/pgahq/coach-tools-backend"
alias frontend="cd ~/src/pgahq/coaching-programs-frontend"
alias backoffice="cd ~/src/pgahq/backoffice-frontend"
alias mobile="cd ~/src/pgahq/coach-tools-mobile-frontend"
alias dotcom="cd ~/src/pgahq/www-pga-com/"
alias pgacom="dotcom"
alias obsidian="cd ~/src/jameslvdb/obsidian"

# edit config file aliases
alias fishconfig="nvim ~/.config/fish/config.fish"

# Rails-specific aliases
alias be="bundle exec"

# Docker aliases
alias oracle-down="docker-compose down -- oracledb"
alias oracle-up="docker-compose up -d -- oracledb"

# GQL aliases
alias dump_gql_schema="rake graphql:schema:idl"

# Work aliases
alias coworking-meet="pbcopy https://meet.google.com/twz-aoep-thx"
alias looker="open https://pgahq.cloud.looker.com/sql"

# Python aliases
alias python="python3"
alias pip="pip3"

# gcc alias 
alias gcc="gcc-13"

starship init fish | source
status --is-interactive; and rbenv init - fish | source

fish_add_path /opt/homebrew/sbin
fish_add_path ~/src/flutter/bin

set PATH ~/.config/emacs/bin/ $PATH
# set PATH /usr/local/bin

source /opt/homebrew/opt/asdf/libexec/asdf.fish
status --is-interactive; and nodenv init - fish | source
