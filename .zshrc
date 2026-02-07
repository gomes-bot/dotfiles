export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

tm() {
  if [[ -n "$TMUX" ]]; then
    echo "Already in tmux."
    return 0
  fi
  tmux attach -t main 2>/dev/null || tmux new -s main
}
export PATH="$HOME/.local/bin:$PATH"
# opencode
export PATH=$HOME/.opencode/bin:$PATH
# oh my zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git macos sudo colorize yarn node npm tmux)
source $ZSH/oh-my-zsh.sh
alias v="nvim"
# Tmux autostart
export ZSH_TMUX_AUTOSTART=true
# Aliases
alias sit="cd $HOME/Sites"
# Editor
export EDITOR=/opt/homebrew/bin/nvim
export VISUAL=/opt/homebrew/bin/nvim
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
