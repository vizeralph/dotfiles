####################
# SHELL PARAMETERS #
####################
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

###################
# ZSH LINE EDITOR #
###################
bindkey -e

###########
# ALIASES #
###########
alias grep='grep --color=auto'
alias ls='eza --icons --group-directories-first'

##################
# PROMPT & THEME #
##################
eval "$(starship init zsh)"

###########
# PLUGINS #
###########
ZSH_PLUGIN_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/plugins"
PLUGINS=( zsh-autocomplete zsh-autosuggestions zsh-syntax-highlighting )

for plugin in "${PLUGINS[@]}"; do
    target="$ZSH_PLUGIN_DIR/$plugin"

    if [[ -f "$target/$plugin.plugin.zsh" ]]; then
        source "$target/$plugin.plugin.zsh"
    elif [[ -f "$target/$plugin.zsh" ]]; then
        source "$target/$plugin.zsh"
    fi
done
