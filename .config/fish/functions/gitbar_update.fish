# In case of errors -- check variable. It can contains some extra stuff. 
# It should contain path to the gitbar update file
function gitbar_update --on-event fish_postexec --description 'Update tmux gitbar'
  eval "$PROMPT_COMMAND"
end
