.PHONY: install.miniconda3
install.miniconda3:
	@ wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
		bash Miniconda3-latest-Linux-x86_64.sh

.PHONY: install.nvim
install.nvim:
	@ curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage && \
		chmod u+x nvim.appimage && \
		cp nvim.appimage $$(dirname $$(which conda))/nvim

.PHONY: install.conda.tools
install.conda.tools:
	@ conda install -y -c conda-forge \
		tmux vim cmake git
	@ conda install -y -c conda-forge \
		zsh fzf neovim ripgrep

.PHONY: install.vimrc.with.plug
install.vimrc.with.plug:
	@ cp ~/.vimrc ~/.vimrc_bk; cp .vimrc ~/.vimrc
	@ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@ vim  +'PlugInstall' +qall

.PHONY: all
all:
	@ make install.miniconda3
	@ make install.conda.tools
	@ make install.vimrc.with.plug
