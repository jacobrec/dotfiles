set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stagedstate '→ '
set __fish_git_prompt_char_untrackedfiles '☡ '
set __fish_git_prompt_char_stashstate '↩ '
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

set -U fish_prompt_pwd_dir_length 0
set -U fish_color_cwd blue
set -U fish_color_operator green

function fish_prompt
  set last_status $status

  # user and host
  set_color $fish_color_user -o
  printf '%s@%s:' (whoami) (cat /etc/hostname)

  # directories
  set_color normal
  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  # fish git magic
  printf '%s' (__fish_git_prompt)

  if test 0 = $last_status
    set_color green
  else
    set_color red
    printf "|%s|" $last_status
  end

  # That nice little icon
  printf '$ '
  set_color normal
end
