# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

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
#force_color_prompt=yes

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

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

# reset intratubes
alias fixint='sudo modprobe -r iwlwifi; sudo modprobe iwlwifi 11n_disable=0'

# reset and kill n
alias intnon='sudo modprobe -r iwlwifi; sudo modprobe iwlwifi 11n_disable=1'

alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias ..6="cd ../../../../../.."
alias ..7="cd ../../../../../../.."
alias ..8="cd ../../../../../../../.."
alias ..9="cd ../../../../../../../../.."
alias ..10="cd ../../../../../../../../../.."

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."
alias .........="cd ../../../../../../../.."
alias ..........="cd ../../../../../../../../.."
alias ...........="cd ../../../../../../../../../.."

function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
function cs() { cd "$1" && ls; }

#Hadoop alias
alias hl="hadoop fs -ls"
alias hp="hadoop fs -put"

#Lock keyboard 4 babby!?!
alias lk="perl ~/.lk4b.pl"

#Open correct Ruby repl, irb1.9.1
alias ir="irb1.9.1"

#Python convert xlsx to csv
alias x2c="/home/james/src/opensource/pythontools/xlsx2csv/xlsx2csv.py"

#Python check delimeters in table
alias ctd="/home/james/src/opensource/pythontools/check_delim.py"

alias scr="screen -d -R"

bind '"[5~": beginning-of-history'
bind '"[6~": end-of-history'

#bsv stuff
alias ig="egrep -i --color"
alias pig="grep -P --color"
alias wg="egrep -iw --color"
alias bsc="cut -d '|' -f"
alias ssc="sed -r 's/\s+/ /g' | cut -d ' ' -f"
alias kw="sed 's/^\s*//'"
function header0 () { head -n 1 $1 | sed 's/||/|@#@#@#@#|/g' | sed 's/^/|/' | sed 's/|/\n/g' | nl -nrz -v 0 -w2 -s ":" | grep -v "@#@#@#@#" | column; }
function header1 () { head -n 1 $1 | sed 's/||/|@#@#@#@#|/g' | sed 's/^/|/' | sed 's/|/\n/g' | nl -nrz -v 1 -w2 -s ":" | grep -v "@#@#@#@#" | column; }
alias ds="sed 's/$/\n/'"
alias coc="sort | uniq -c | sed 's/^\s*//' | sed -r 's/\s+/ /' | cut -d ' ' -f 1 | sort | uniq -c | sed 's/^\s*//'"
alias bawk="awk -F'|'"

#set -o vi
#bind '"\ee": emacs-editing-mode'
#set -o emacs
#bind '"\ee": vi-editing-mode'

export GIT_EDITOR=vim
export VISUAL=vim
export EDITOR=vim

stty -ixon

alias filetypes='find -type f -name '"'"'*.*'"'"' | sed '"'"'s|.*\.||'"'"' | sort -u'

function loop () { while true; do clear; $1; read; done; }

function myip () { if [ $# -eq 0 ]; then set -- "tun0"; fi; ifconfig "$1" | grep inet | head -n 1 | cut -d ":" -f 2 | cut -d " " -f 1; }
function xip () { myip $1 | tee /dev/tty | xclip; }

alias vi='vim'
alias nv='nvim'
export PYTHONSTARTUP=~/.pythonrc

function xit () { echo -n $1 | xclip; }

alias uwc='sort | uniq | wc'

alias password="shuf /usr/share/dict/words | grep -v '[^a-z]' | grep '....' | grep -v '.....' | grep -v sS | sed -e 's/^./\U&/g' | head -n 3 | awk 'ORS=\" \"' | sed 's/\s//g; s/$/\n/'"
alias passwords="while true; do clear; password; read; done"

#Last command to xclip
function x! () {
  if [ $# -eq 0 ]; then set -- "1"; fi;
  a=`expr $1 + 1`
  b=`history $a | head -n 1 | sed -r 's/\s+/ /g' | cut -d ' ' -f 3-`;
  echo -n $b | xclip;
  echo $b;
}

function wcm () { echo -n $1 | wc -m; }

#Find .swp file[s] generated from target file[s]
function swpfind () { for i in *; do find /home/james/.vimswap -type f ! -iname ".*" | grep "$i""\.swp"; done; }
#Find and xclip .swp file[s] generated from target file[s]
#function swpfindx () { a=; for i in *; do a+=`find /home/james/.vimswap -type f ! -iname ".*" | grep "$i""\.swp"`; echo -n "$a" | xclip; echo "$a"; done; }
#Find and open .swp file[s] generated from target file[s]
function swpfindvi () { vi `for i in *; do find /home/james/.vimswap -type f ! -iname ".*" | grep "$i""\.swp"; done`; }
#Find file[s] that generated target .swp file[s]
function swpback () { for i in ~/.vimswap/*; do sed -n 1p "$i" | cut -d 0 -f 3 | sed -r 's/\s.*//; s/utf-8$//'; done; }
#Find and xclip file[s] that generated target .swp file[s]
#function swpbackx () { for i in ~/.vimswap/*; do a=`sed -n 1p "$i" | cut -d 0 -f 3 | sed -r 's/\s.*//; s/utf-8$//'`; echo -n "$a" | xclip; echo "$a"; done; }
#Find and open file[s] that generated target .swp file[s]
function swpbackvi () {
  a=( `find ~/.vimswap -type f` )
  b=( `for i in "${a[@]}"; do sed -n 1p "$i" | cut -d 0 -f 3 | sed -r 's/\s.*//; s/utf-8$//'; done | tr "\\n" " " | sed 's/~\(.*\)/\/home\/james$1/'; echo` )
  echo ${b[@]}
  vi -p ${b[@]};
}

#[Execute] random file, copying file name to xclip
function rf () { if [ ! -d "$1" ]; then "$1" `find "${@:2}" -type f | shuf | head -n 1`; else find "${@}" -type f | shuf | head -n 1 | tee >(xclip); fi; }

#Use keychain
alias ssh='eval $(/usr/bin/keychain --eval --agents ssh -Q --quiet ~/.ssh/id_rsa) && ssh'

#Ethernet
alias ethernet='sudo kill `ps aux | grep "dhclient eth0" | grep -v "grep" | ssc 2` 2>/dev/null; sudo ifconfig eth0 up; sudo dhclient eth0'

#!!
set -o vi
