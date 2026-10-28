#####################
# INTERACTIVE GUARD #
#####################
[[ $- != *i* ]] && return

###########
# ALIASES #
###########
alias grep='grep --color=auto'
alias ls='eza --icons --group-directories-first --header'

##########
# PROMPT #
##########
PS1='[\W]\$ '
