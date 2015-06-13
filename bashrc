# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# Newline before subsequent PS1s
function __ps1_newline_login {
  if [[ -z "${PS1_NEWLINE_LOGIN}" ]]; then
    PS1_NEWLINE_LOGIN=true
  else
    printf '\n'
  fi
}
PROMPT_COMMAND='__ps1_newline_login'
TON='$(tput bold)'
TOFF='$(tput sgr0)'
function TP () { echo "${TON}$(tput setaf $@)"; }
RED="\033[38;5;1m"
YEL="\033[33m"
GRN="\033[38;5;15m\033[38;5;2m"
CYN="\033[1;36m"

#PROMPT_USER_COLOR=`TP 1` # BOLD RED
#PROMPT_PREPOSITION_COLOR=`TP 7` # BOLD WHITE
#PROMPT_DEVICE_COLOR=`TP 3` # BOLD YELLOW
#PROMPT_DIR_COLOR=`TP 2` # BOLD GREEN
#PROMPT_GIT_STATUS_COLOR=`TP 6` # BOLD CYAN
#PROMPT_GIT_PROGRESS_COLOR=`TP 7` # BOLD VIOLET
#PROMPT_SYMBOL_COLOR=`TP 1` # BOLD RED

PROMPT_USER_COLOR="$(tput bold)${RED}"
PROMPT_PREPOSITION_COLOR="$(tput bold)${YEL}"
PROMPT_DEVICE_COLOR="$(tput bold)${GRN}"
PROMPT_DIR_COLOR="$(tput bold)${CYN}"
PROMPT_GIT_STATUS_COLOR=`TP 5`
PROMPT_GIT_PROGRESS_COLOR="$(tput bold)${YEL}"
PROMPT_SYMBOL_COLOR=`TP 5`
export PS2="${TON}$(TP 5)> ${TOFF}"
#export PS2="> "

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
    #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    #;;
#*)
    #;;
#esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# reset and kill n
alias intnon='sudo modprobe -r iwlwifi; sudo modprobe iwlwifi 11n_disable=1'

function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

#Open correct Ruby repl, irb1.9.1
alias ir="irb1.9.1"

#Python convert xlsx to csv
alias x2c="/home/james/src/opensource/pythontools/xlsx2csv/xlsx2csv.py"

#Python check delimeters in table
alias ctd="/home/james/src/opensource/pythontools/check_delim.py"

export GIT_EDITOR=vim
export VISUAL=vim
export EDITOR=vim
export VIMRUNTIME=/usr/share/vim/vim74

#Avoid typing . for bin scripts that change directory
alias cdg=". /home/james/bin/cdg"

stty -ixon

alias filetypes='find -type f -name '"'"'*.*'"'"' | sed '"'"'s|.*\.||'"'"' | sort -u'

function loop () { while true; do clear; $@; read; done; }

function myip () { if [ $# -eq 0 ]; then set -- "tun0"; fi; ifconfig "$1" | grep inet | head -n 1 | cut -d ":" -f 2 | cut -d " " -f 1; }
function xip () { myip $1 | tee /dev/tty | xclip; }

alias vi='vim'
alias nv='nvim'
export PYTHONSTARTUP=~/.pythonrc.py

alias password="shuf /usr/share/dict/words | grep -v '[^a-z]' | grep '....' | grep -v '.....' | grep -v sS | sed -e 's/^./\U&/g' | head -n 3 | awk 'ORS=\" \"' | sed 's/\s//g; s/$/\n/'"
alias passwords="while true; do clear; password; read; done"

#Use keychain
alias kch='eval $(/usr/bin/keychain --eval --agents ssh -Q --quiet ~/.ssh/id_rsa)'

#Ethernet
alias ethernet='killInternet; \
        sudo ifconfig eth0 up; \
        sudo dhclient eth0'
alias killInternet='sudo kill `ps aux | grep "eth0" | grep -v "grep" | ssc 2` 2>/dev/null; \
        sudo kill `ps aux | grep "wlan0" | grep -v "grep" | ssc 2` 2>/dev/null; \
        sudo kill `ps aux | grep "dhclient" | grep -v "grep" | ssc 2` 2>/dev/null'

# Vi mode + emacs in insert
set -o vi
bind '"[5~": beginning-of-history'
bind '"[6~": end-of-history'
bind -m vi-move "g":beginning-of-history
bind -m vi-move "G":end-of-history
bind -m vi-command "o":insert-last-argument
bind -m vi-insert "\C-l.":clear-screen
bind -m vi-insert "\C-a.":beginning-of-line
bind -m vi-move "\C-a.":beginning-of-line
bind -m vi-insert "\C-e.":end-of-line
bind -m vi-move "\C-e.":end-of-line
stty werase undef # Required for remapping C-w
bind -m vi-insert "\C-w.":unix-filename-rubout
bind -m vi-insert "\C-n.":next-history
bind -m vi-insert "\C-p.":previous-history
bind -m vi-insert "\C-f.":forward-char
bind -m vi-insert "\C-b.":backward-char
bind -m vi-move "\C-d.":vi-delete
bind -m vi-insert "\C-d.":vi-delete
bind -m vi-insert "\C-k.":
bind -m vi-insert "\C-o.":
#bind -m vi-insert "kj":vi-movement-mode forward-char

# Add command to history
bind -m vi-insert  '"\C-q":  "\C-e\C-u history -s '\''\C-y'\''; echo -n '\''\C-y'\'' | xclip\C-m"'
bind -m vi-command '"\C-q": "I\C-e\C-u history -s '\''\C-y'\''; echo -n '\''\C-y'\'' | xclip\C-m"'

#This stuff available in vim, etc
#BASH_ENV="~/.bash_ni"

#Get rid of Gnome desktop bullshit
alias killGnome='gsettings set org.gnome.desktop.background show-desktop-icons false'

export PATH="$PATH:$HOME/bin"

#Sbt console readline survives Ctrl-Z
alias sbt-console='rlwrap sbt console -Xnojline'
alias sbt-consoleQuick='rlwrap sbt consoleQuick -Xnojline'

#Color ag
alias cag='ag --color'

#Easy nohup
function quiet () { (nohup "$@" > /dev/null &); }
function quieter () { (nohup "$@" > /dev/null &); exit; }

#Generate output tersely and check &&/||
alias A='echo A'
function assert () {
  if [ "$1" = -v ]; then
    ("$@:2") && echo OK || echo NOPE
  else
    ("$@" &>/dev/null) && echo OK || echo NOPE
  fi
}

export PERL_MB_OPT="--install_base \"~/perl5\""
export PERL_MM_OPT="INSTALL_BASE=~/perl5"
export PERL5LIB=~/perl5/lib/perl5/local/
#export PERL5LIB=~/.cpan/build/JSON-2.90-SdtLVG/lib/
#export PERL5LIB=~/.cpan/build/Math-Round-0.07-vJd8__/blib/lib/

# Run twolfson/sexy-bash-prompt
. ~/.bash_prompt

# Fzf stuff
[ -f ~/.fzf.bash ] && {
  source ~/.fzf.bash
  bind -m vi-command '"\C-f": "A | fzf\e"'
}

# Open output in vim
bind -m vi-command '"\C-v": "Ivi $(\eA)\e"'

# z jump around
[ -f ~/src/opensource/z/z.sh ] && source ~/src/opensource/z/z.sh

# bd back to directory
alias bd=". ~/src/opensource/bd/bd -si"
