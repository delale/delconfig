### EXPORT
export TERM="xterm-256color"
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboo|history|cd -|cd ..)"

# GPG
GPG_TTY=$(tty)
export GPG_TTY

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fzf trigger
export FZF_COMPLETION_TRIGGER='--'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/delale/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/delale/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/delale/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/delale/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

## ZSH SETTINGS
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

### CHANGE TITLE OF TERMINALS
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*|iterm2*)
    PROMT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.**}:${PWD/#$HOME/\~}\007"'
	;;
  screen*)
     PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
     ;;
esac

## MANPAGER
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

### ALIASES
# Changing "ls" to "eza"
alias ls='eza --color=always --group-directories-first --icons' 
alias la='eza -al --color=always --group-directories-first --icons'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons'  # long format
alias lt='eza -TL=3 --color=always --group-directories-first --icons' # tree listing
alias lta='eza -aTL=3 --color=always --group-directories-first --icons' # tree listing all
alias l.='eza -a --group-directories-first | egrep "^\."' # listing only hidden files and folders

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp"
alias mv='mv -i'
alias rm='rm -i'

# adding flags
alias df='df -h' # human-readable sizes
alias free='free -m' # show sizes in MB

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# Play audio files in current dir by type
alias playwav='deadbeef *.wav'
alias playogg='deadbeef *.ogg'
alias playmp3='deadbeef *.mp3'

# Play video files in current dir by type
alias playavi='vlc *.avi'
alias playmov='vlc *.mov'
alias playmp4='vlc *.mp4'

# alias find to use fzf
alias fa='find * -type f | fzf --reverse --preview "bat --color=always --style=numbers --line-range=:500 {}"' # all files
alias fs='fzf --height=40 --reverse --preview "bat --color=always --style=numbers --line-range=:500 {}"'

# # some more ls aliases
# alias ll='ls -alF'
# alias la='ls -lA'
# alias l='ls -CF'
# alias ls='ls -lh'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# dotfiles & config git bare repo
alias myconfig='/usr/bin/git --git-dir=/Users/delale/.cfg/ --work-tree=/Users/delale'

# NeoVim as Vim
# Kickstart.nvim
alias nvk='NVIM_APPNAME="nvim-kickstart" nvim'

# Python
alias pip='pip3'
alias python='python3'

# Praat
alias praat='/Applications/Praat.app/Contents/MacOS/Praat'

# radian
alias r='radian'

# VSCode
alias code='/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron'

# >>> PLUGINS >>>
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# qfc
[[ -s "$HOME/.qfc/bin/qfc.sh" ]] && source "$HOME/.qfc/bin/qfc.sh"

# auto-suggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 

# fzf-tab
source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh 

# fzf
source "/opt/homebrew/opt/fzf/shell/completion.zsh"
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zoxide
eval "$(zoxide init zsh)"

# <<< PLUGINS <<<

# SOURCE CUSTOM FUNCTIONS
source ~/.zsh_functions

### PROMPT
eval "$(starship init zsh)"
