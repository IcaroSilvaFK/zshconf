export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias ll="ls -lah"
alias gs="git status"
alias c="clear"

export PATH="$HOME/bin:/usr/local/bin:$PATH"

set SPACEFISH_PROMPT_ADD_NEWLINE false

alias n="npm"
alias ni="npm install"
alias nr="npm run"
alias nd="npm run dev"

  export NVM_DIR="$HOME/.nvm"
  [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
  [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion


# Zinit setup (carrega Zinit se estiver instalado)
if [[ ! -f ~/.zinit/bin/zinit.zsh ]]; then
  mkdir -p ~/.zinit
  git clone https://github.com/zdharma-continuum/zinit.git ~/.zinit/bin
fi

source ~/.zinit/bin/zinit.zsh

# Autosuggestions
zinit light zsh-users/zsh-autosuggestions

# Syntax Highlighting (deve ser carregado por último)
zinit light zsh-users/zsh-syntax-highlighting

zinit light denysdovhan/spaceship-prompt
zinit cdclear -q
zinit snippet https://github.com/denysdovhan/spaceship-prompt/raw/master/spaceship.zsh

# FZF plugin
zinit light junegunn/fzf
zinit light junegunn/fzf-bin

if ! command -v fzf >/dev/null 2>&1; then
  if [[ -d "$(brew --prefix)/opt/fzf)" ]]; then
    echo "Instalando FZF..."
    "$(brew --prefix)/opt/fzf/install"
  else
    echo "FZF não encontrado no Homebrew. Instalando agora..."
    brew install fzf && "$(brew --prefix)/opt/fzf/install"
  fi
fi

# $(brew --prefix)/opt/fzf/install

export FZF_DEFAULT_COMMAND='fd --type f'  # precisa do fd (brew install fd)
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
bindkey -s '^D' 'fzf --preview "ls -alF {}" --preview-window=up:30%:hidden\n'

# Preview com bat (brew install bat)
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always {} | head -100'"

# Dracula Theme (para terminal, não o Zsh diretamente)
# Baixe o esquema de cores para seu terminal em:
# https://draculatheme.com/

# Opcional: Prompt mais limpo e colorido
SPACESHIP_PROMPT_ORDER=(
  user
  dir
  host
  git
  node
  docker
  exec_time
  line_sep
  battery
  jobs
  exit_code
  char
)

# Exemplo de customização do prompt
SPACESHIP_CHAR_SYMBOL="➜"
SPACESHIP_CHAR_COLOR_SUCCESS="green"
SPACESHIP_CHAR_COLOR_FAILURE="red"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# .zshrc
export FZF_DEFAULT_COMMAND='fd --type f'  # usa fd ao invés de find
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"

# Ctrl+T com preview de arquivos
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always {} | head -100'"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"


export PATH="$HOME/go/bin:$PATH"