#------------------------------------------

#prompt

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'

function zle-line-init {
	if [ "$vcs_info_msg_0_" ]; then		
		print -n "\e]2;$PWD *$vcs_info_msg_0_\a"
		PS1='%F{blue}%b%~%#%f '
	else			
		print -n "\e]2;$PWD\a"
		PS1='%F{green}%b%~%#%f '
	fi
    zle reset-prompt
}
zle -N zle-line-init



#------------------------------------------

cddotdot() { cd .. ; pwd ; zle reset-prompt }
zle -N cddotdot

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
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[ShiftTab]="${terminfo[kcbt]}"
key[F2]="${terminfo[kf2]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        up-line-or-beginning-search
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      down-line-or-beginning-search
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history
[[ -n "${key[ShiftTab]}"  ]] && bindkey -- "${key[ShiftTab]}"  reverse-menu-complete
[[ -n "${key[F2]}"  ]] && bindkey -- "${key[F2]}"  			   cddotdot

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start {
		echoti smkx
	}
	function zle_application_mode_stop {
		echoti rmkx
	}
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

#------------------------------------------

#------------------------------------------


setopt EXTENDED_GLOB
setopt GLOB_DOTS
setopt NO_NOMATCH
setopt RM_STAR_SILENT
export LISTMAX=256

#------------------------------------------

#------------------------------------------

alias ls='ls -F --color=auto'
alias grep='grep --colour=auto'
alias alert='echo $"\a"'
alias nnn='print -n "\e]2;nnn\a"; nnn'