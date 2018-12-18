clear
toilet -f smblock anonymous
IP=$(curl -s ipinfo.io/ip)
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
if [ $(grep $IP ~/dotfiles/servidores) > 0 ]; then
  PROMPT="${ret_status} ($IP) %{$fg[cyan]%}%c%{$reset_color%} "
else
  PROMPT="${ret_status} %{$fg[red]%}($IP) %{$fg[cyan]%}%c%{$reset_color%} "
fi
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
