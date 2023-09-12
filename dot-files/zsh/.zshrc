# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Set zsh theme
ZSH_THEME="half-life"

# Update zsh without asking
zstyle ':omz:update' mode auto      # update automatically without asking

# Disable auto-title
DISABLE_AUTO_TITLE="true"

# Set format of timestamps in history command output
HIST_STAMPS="yyyy-mm-dd"

# Load zsh plugins
plugins=(git)

# Set default text editor to NeoVim
export EDITOR=nvim

# Run oh-my-zsh script
source $ZSH/oh-my-zsh.sh

# Add rust to PATH
export PATH="/home/frian/.cargo/bin:$PATH"
