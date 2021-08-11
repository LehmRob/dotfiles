# Inspiration is taken from https://github.com/topfunky/zsh-simple/blob/master/.zshrc
#
autoload -U colors
colors
setopt prompt_subst

local smiley="%(?,%{$fg[green]%}☺%{$reset_color%},%{$fg[red]%}☹%{$reset_color%})"

PROMPT='%~ ${smiley}  %{$reset_color%}'

setopt menucomplete
zstyle ':completion:*' menu select
autoload compinit
compinit
WORDCHARS='~!#$%^&*(){}[]<>?.+;-'

# source some of the files

if [ -f $HOME/.fzf.zsh ]; then
	source $HOME/.fzf.zsh
fi

if [ -e $HOME/.alias ]; then
	source $HOME/.alias
fi

if [ -e $HOME/.exports ]; then
	source $HOME/.exports
fi

if [ -e $HOME/.zshhash ]; then
    source $HOME/.zshhash ];
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
