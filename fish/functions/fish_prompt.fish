set __fish_git_prompt_showupstream auto
set __fish_git_prompt_color_upstream magenta

set __fish_git_prompt_showdirtystate true
set __fish_git_prompt_color_dirtystate red --bold

set __fish_git_prompt_showstashstate true
set __fish_git_prompt_color_stashstate blue

set __fish_git_prompt_showuntrackedfiles true
set __fish_git_prompt_color_untrackedfiles cyan

set __fish_git_prompt_color_prefix yellow
set __fish_git_prompt_color_suffix yellow

set __fish_git_prompt_color_branch yellow

set __fish_git_prompt_color_merging red

function fish_prompt --description "Write out the prompt"
  printf '%s%s%s%s%s ➥ ' (set_color green) (prompt_pwd) (__fish_git_prompt) (set_color cyan)
  set_color normal
  printf ' '
end
