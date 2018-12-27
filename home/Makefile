DOTFILEPATH := $(shell pwd)

$(HOME)/.%: %
	ln -sf $(DOTFILEPATH)/$^ $@

zsh: $(HOME)/.zshrc
tmux: $(HOME)/.tmux.conf
nvim: $(HOME)/.config/nvim/init.vim

$(HOME)/.config/nvim/init.vim: $(DOTFILEPATH)/nvim.vim
	ln -sf $^ $@

all: zsh tmux nvim
