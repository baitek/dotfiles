PROMPT="%(?:✅:❌) %{$FG[069]%}%~%{$reset_color%}"
PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[015]%}(%{$FG[009]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[015]%} ⚡)"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[015]%})"
