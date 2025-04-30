#------------------------------------------
# настройка alias 
alias ls='ls -F --color=auto'
alias grep='grep --colour=auto'
alias nnn='print -n "\e]2;nnn\a"; nnn'
alias vi='nvim'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
#------------------------------------------

#------------------------------------------
# общие настройки
setopt EXTENDED_GLOB
setopt GLOB_DOTS
setopt NO_NOMATCH
setopt RM_STAR_SILENT
export LISTMAX=256
#------------------------------------------

#------------------------------------------
# поиск по истории
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

setopt APPEND_HISTORY 
setopt SHARE_HISTORY 
setopt INC_APPEND_HISTORY 
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
#------------------------------------------

#------------------------------------------
# выполнение rehash при установке новых приложений
TRAPUSR1() { rehash }
#------------------------------------------

#------------------------------------------
# подсветка синтаксиса командной строки
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/catppuccin_frappe-zsh-syntax-highlighting.zsh
#------------------------------------------

#------------------------------------------
# настройка ввода

bindkey "^[[H" beginning-of-line #Home
bindkey "^[[F" end-of-line #End
bindkey "^[[5~" beginning-of-buffer-or-history #page up
bindkey "^[[6~" end-of-buffer-or-history #page down
bindkey "^[[3~" delete-char #delete
bindkey "^?" backward-delete-char #backspace
bindkey "^[[A" up-line-or-beginning-search #up
bindkey "^[[B" down-line-or-beginning-search #down
#------------------------------------------

#------------------------------------------
# настройка prompt

PS1='%~ %# '

precmd() {
	echo -e '\a'
}

#------------------------------------------
# стартовое сообщение

/usr/local/bin/startup.sh
