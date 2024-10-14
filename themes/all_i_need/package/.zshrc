#------------------------------------------
#настройка alias 
alias ls='ls -F --color=auto'
alias grep='grep --colour=auto'
alias alert='echo $"\a"'
alias nnn='print -n "\e]2;nnn\a"; nnn'
#------------------------------------------

#------------------------------------------
#общие настройки
setopt EXTENDED_GLOB
setopt GLOB_DOTS
setopt NO_NOMATCH
setopt RM_STAR_SILENT
export LISTMAX=256
#------------------------------------------

#------------------------------------------
#prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'

function zle-line-init zle-keymap-select {
	
	#git
	if [ "$vcs_info_msg_0_" ]; then		
		PS1='%F{blue}%b%~%#%f '

	#обычная консоль
	else	
		
		if [ ${KEYMAP} == "main" ]; then
			prompt="%F{white}"
		else
			prompt="%F{yellow}"
			prompt+="${KEYMAP} "
		fi

		prompt+="%~ " #выводит текущий путь
		prompt+="%# " #выводит привелегии пользователя
		prompt+="%f" #останавливает смену цветов 
		PS1=$prompt
		
	fi
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
#------------------------------------------

#------------------------------------------
#поиск по истории
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
#Выполнение rehash при установке новых приложений
TRAPUSR1() { rehash }
#------------------------------------------

#------------------------------------------
#подсветка синтаксиса командной строки
typeset -A ZSH_HIGLIGHT_STYLES
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[path]="fg=255"
#------------------------------------------

#------------------------------------------
#настройка ввода

#vi-mode
bindkey -v
#уменьшение времени при нажатии ESC
export KEYTIMEOUT=1
#включение режим vi для всех программ использующих readline
set editing-mode vi

bindkey "^[[1~" beginning-of-line #Home
bindkey "^[[4~" end-of-line #End
bindkey "^[[5~" beginning-of-buffer-or-history #page up
bindkey "^[[6~" end-of-buffer-or-history #page down
bindkey "^[[3~" delete-char #delete
bindkey "^?" backward-delete-char #backspace
bindkey "^[[A" up-line-or-beginning-search #up
bindkey "^[[B" down-line-or-beginning-search #down
#------------------------------------------




