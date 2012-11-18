function fish_prompt --description "Write out the prompt"
  printf '%s%s%s%s%s ➥ ' (set_color green) (prompt_pwd) (parse_git_branch) (set_color cyan)
  set_color normal
  printf ' '
end
