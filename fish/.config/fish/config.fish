if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias ls="exa"
alias l="exa -lah --git"
alias cat="bat"

# cd-to-repo aliases
alias backend="cd ~/src/pgahq/coach-tools-backend"
alias frontend="cd ~/src/pgahq/coaching-programs-frontend"
alias mobile="cd ~/src/pgahq/coach-tools-mobile-frontend"
alias redesign="cd ~/src/pgahq/pga-site-redesign"

# edit config file aliases
alias fishconfig="vim ~/.config/fish/config.fish"

# Rails-specific aliases
alias be="bundle exec"

# GQL aliases
alias dump_gql_schema="rake graphql:schema:idl"

# Work aliases
alias coworking-meet="pbcopy https://meet.google.com/twz-aoep-thx"
alias looker="open https://pgahq.cloud.looker.com/sql"

# Python aliases
alias python="python3"
alias pip="pip3"

starship init fish | source
status --is-interactive; and rbenv init - fish | source

fish_add_path /opt/homebrew/sbin

source /opt/homebrew/opt/asdf/libexec/asdf.fish
