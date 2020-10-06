# Prompt

PS1="\[\033[38;5;49m\][\w]\n\[\033[38;5;39m\]--> \[$(tput sgr0)\]"

#git_branch () { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'; }
#HOST='\033[02;36m\]\h'; HOST=' '$HOST
#TIME='\033[01;31m\]\t \033[01;32m\]'
#LOCATION=' \033[01;34m\]`pwd | sed "s#\(/[^/]\{1,\}/[^/]\{1,\}/[^/]\{1,\}/\).*\(/[^/]\{1,\}/[^/]\{1,\}\)/\{0,1\}#\1_\2#g"`'
#BRANCH=' \033[00;33m\]$(git_branch)\[\033[00m\]\n\$ '
#PS1=$TIME$USER$HOST$LOCATION$BRANCH

neofetch \
    --block_range 1 8 \
    --line_wrap off \
    --bold off \
    --uptime_shorthand on \
    --gtk_shorthand on \
    --memory_display bar \
    --colors 4 1 8 8 8 

# Variables
EDITOR=vim

# Don't have to CD into dir
shopt -s autocd
# Autocorrect cd mispell
shopt -s cdspell

# Vim commands
set -o vi

# Aliases file
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
[ -f "$HOME/.config/env" ] && source "$HOME/.config/env"


# COLORS
wal -e -q --theme base16-nord


#export DISPLAY=`grep -oP "(?<=nameserver ).+" /etc/resolv.conf`:0.0
#export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
export LIBGL_ALWAYS_INDIRECT=1

export PATH="/home/surfaceluca/.local/bin:$PATH"

