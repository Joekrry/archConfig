if status is-interactive
    ~/Projects/minimaFetch/minimafetch
end

fish_add_path ~/.cargo/bin

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

# `vim` -> nvim. Shadows the command in interactive fish shells only; the
# real /usr/bin/vim binary is untouched. Use `command vim` to bypass this.
function vim --wraps=nvim --description 'alias vim=nvim'
    nvim $argv
end

starship init fish | source
