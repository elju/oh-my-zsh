# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

RAND_CLR=$(($RANDOM%257))

if hostname | grep -q api; then
  if [[ $UID -eq 0 ]]; then
    hundred_prompt_color="$FG[016]"
    hundred_prompt_bg="$BG[011]"
  else
    hundred_prompt_color="$FG[226]"
  fi
elif hostname | grep -q cms; then
  if [[ $UID -eq 0 ]]; then
    hundred_prompt_color="$FG[016]"
    hundred_prompt_bg="$BG[004]"
  else
    hundred_prompt_color="$FG[069]"
  fi
fi
local user_host='%{$terminfo[bold]$hundred_prompt_bg$hundred_prompt_color%}%n@%M%{$reset_color%}'

local current_dir='%{$terminfo[bold]$FG[201]%} %~%{$reset_color%}'
local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby='%{$FG[220]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm_ruby='%{$FG[220]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi

local git_branch='%{$FG[243]$BG[234]%}$(git_prompt_info)%{$reset_color%}'

PROMPT="╭─${user_host} ${current_dir} ${rvm_ruby} ${git_branch} %{$FG[040]\|\|%}%{$reset_color%}
╰─ ~ "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FX[bold]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›%{$reset_color%} "
