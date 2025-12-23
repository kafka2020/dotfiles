# 1. P10K INSTANT PROMPT (Всегда должно быть первым!)
# Включает мгновенное появление строки приглашения, даже если zsh еще грузится
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# 2. HOMEBREW SETUP
# Теперь безопасно загружаем brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Использовать стандартные цвета (синие папки), а не кислотные OMZ
zstyle ':omz:lib:theme-and-appearance' ls-colors 'yes' 

# 3. OH MY ZSH SETUP
export ZSH="$HOME/.oh-my-zsh"

# Тема оформления
ZSH_THEME="powerlevel10k/powerlevel10k"

# Настройки обновлений (проверять каждые 13 дней)
zstyle ':omz:update' frequency 13

# 4. PLUGINS
# Я добавил сюда базовый набор из вашего первого запроса.
# Убедитесь, что вы их установили через brew, как обсуждали ранее!
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Запуск движка OMZ
source $ZSH/oh-my-zsh.sh

# 5. USER CONFIGURATION
# Здесь подключаем утилиты, которые требуют инициализации ПОСЛЕ загрузки Zsh
# Если вы установили zoxide и fzf, раскомментируйте эти строки:

# eval "$(zoxide init zsh)"  # Инициализация zoxide
# source <(fzf --zsh)        # Инициализация fzf

# 6. P10K CONFIGURATION
# Загрузка настроек внешнего вида темы
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# --icons: показывать иконки файлов (нужен Nerd Font)
# --group-directories-first: папки всегда сверху
# --git: показывать статус git (изменено/новое)
alias ls="eza --icons --group-directories-first"
alias ll="eza --icons --group-directories-first -l --git"
alias la="eza --icons --group-directories-first -la --git"

# di=1;34 -> directory = bold;blue
export EZA_COLORS="di=1;34"

