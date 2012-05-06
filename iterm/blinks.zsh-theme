# https://github.com/blinks zsh theme

function _prompt_char() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo "%{%F{yellow}%}±%{%f%k%b%}"
  else
    echo '%{%F{yellow}%}:'
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX=" (%{%b%F{yellow}%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%K{black}%b%F{yellow}%})"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{%f%k%b%}
%{%b%F{green}%}%~%{%b%F{yellow}%}$(git_prompt_info)%E%{%f%k%b%}
%{%}$(_prompt_char)%{%} %{%f%k%b%}'

RPROMPT='%{%b%F{black}%}!%!%{%f%k%b%}'
