getmyip () {
  IP=$(timeout 10 curl -s ipinfo.io/ip)
  if [ ! $? -eq 0 ];then
    IP="<none>"
  fi
}
setprompt () {
  getmyip
  if [ $(grep $IP ~/dotfiles/servidores) > 0 ]; then
    PROMPT="${ret_status} %{$fg[green]%}(%D{%L:%M:%S %p}$IP) %{$fg[cyan]%}%c%{$reset_color%} "
  else
    PROMPT="${ret_status} %{$fg[red]%}(%D{%L:%M:%S %p}$IP) %{$fg[cyan]%}%c%{$reset_color%} "
  fi
}
TMOUT=5

TRAPALRM() {
  setprompt
  zle reset-prompt
}
clear
toilet -f smblock anonymous
setprompt
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
