# Default profile file
# Configuration used to setup the shell environment


for file in ~/.{path,aliases,gitignore}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;


zstyle ':vcs_info:git*' formats " %B%F{green}%b%f %m%u%c %a "
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr ' %F{green}✔%f'
zstyle ':vcs_info:*' unstagedstr ' %F{red}❖%f'

setopt prompt_subst

autoload -Uz vcs_info
precmd() {
    vcs_info
    print -P '%B%F{cyan}%~%f%b ${vcs_info_msg_0_}'
}

PROMPT='%B%(!.#.$)%b '
