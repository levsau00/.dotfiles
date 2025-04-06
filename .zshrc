if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("${HOME}/miniconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${HOME}/miniconda3/etc/profile.d/conda.sh" ]; then
        . "${HOME}/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="${HOME}/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# Sublime integration
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

# aliases
alias st=subl

alias gst='git status'
alias gd='git diff'
alias gc='git commit'
alias gcm='git commit -m'
alias pull='git pull'
alias push='git push'

alias od='cd /Users/$USER/Library/CloudStorage/OneDrive-DrexelUniversity'

alias ls='ls --color'

alias wol-pc='wakeonlan d8:5e:d3:0f:b4:3e'
alias shutdown-pc='ssh pc "sudo shutdown -h 0"'
alias reboot-pc='ssh pc "reboot"'

# exports
export HOMEBREW_NO_AUTO_UPDATE=1


# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# init oh-my-posh (should be last line)
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/omp_config.toml)"

