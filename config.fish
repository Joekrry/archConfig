if status is-interactive
    ~/Projects/minimaFetch/minimafetch
end

set -U fish_greeting ""

function starship_transient_prompt_func
  starship module character
end
function starship_transient_rprompt_func
  starship module custom.transient_time
end
function fish_user_key_bindings
    # Accept current grey autosuggestion with Tab or Ctrl-F
    bind \t accept-autosuggestion
end

starship init fish | source
