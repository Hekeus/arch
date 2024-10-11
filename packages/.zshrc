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
		print -n "\e]2;$PWD *$vcs_info_msg_0_\a"
		PS1='%F{blue}%b%~%#%f '

	#обычная консоль
	else	
		prompt="%F{red}"
		case "${KEYMAP}" in 
			vicmd)
				prompt="%F{yellow}"
				;;	
			viins|main)
				prompt+="%F{white}"
				;;
		esac
		prompt+="%~"
		prompt+=" "
		PS1=$prompt
#		print -n "\e]2;$PWD\a"
#		PS1='%F{green}%b%~%#%f '
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
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#------------------------------------------

#------------------------------------------
#настройка ввода

#vi-mode
bindkey -v
#уменьшение времени при нажатии ESC
export KEYTIMEOUT=1
#включение режим vi для всех программ использующих readline
set editing-mode vi

bindkey "^[[H" beginning-of-line #Home
bindkey "^[[4~" end-of-line #End
bindkey "^[[P" delete-char #delete
bindkey "^?" backward-delete-char #backspace
bindkey "^[[A" up-line-or-beginning-search #up
bindkey "^[[B" down-line-or-beginning-search #down
#------------------------------------------




