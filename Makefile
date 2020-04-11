.PHONY: install.miniconda3
install.miniconda3:
	@ wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
		bash Miniconda3-latest-Linux-x86_64.sh
	@ source $$HOME/miniconda3/bin/activate

.PHONY: install.vim8
install.vim8:
	@ sudo add-apt-repository ppa:jonathonf/vim; sudo apt-get update; sudo apt-get install vim

.PHONY: install.nvim
install.nvim:
	@ make install.vim8
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
	@ cp $$HOME/.vimrc $$HOME/.vimrc_bk; cp .vimrc $$HOME/.vimrc
	@ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@ vim  +'PlugInstall' +qall

.PHONY: install.ctags
install.ctags:
	@ tar -zvxf ctags-5.6.tar.gz; cd ctags-5.6; ./configure --prefix=$$HOME; make; make install; cd -; rm -rf ctags-5.6

.PHONY: all
all:
	@ make install.ctags
	@ make install.miniconda3
	@ make install.conda.tools
	@ make install.vimrc.with.plug
