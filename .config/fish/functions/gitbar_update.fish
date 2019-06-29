function gitbar_update --on-event fish_prompt --description 'Update tmux gitbar'
  #fish_postexec
  eval "$PROMPT_COMMAND"
end
