PROMPT="%(?:✅:❌) %{$FG[75]%}%~%{$reset_color%}"
PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[153]%}(%{$FG[209]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[153]%} ⚡)"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[153]%})"
