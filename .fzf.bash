# Setup fzf
# ---------
if [[ ! "$PATH" == */home/james/src/opensource/junegunn/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/james/src/opensource/junegunn/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/james/src/opensource/junegunn/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/james/src/opensource/junegunn/fzf/shell/key-bindings.bash"
