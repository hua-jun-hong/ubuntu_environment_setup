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
	@ cp $$HOME/.vimrc $$HOME/.vimrc_bk; cp .vimrc $$HOME/.vimrc
	@ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@ vim  +'PlugInstall' +qall

.PHONY: install.ctags
install.ctags:
	@ tar -zvxf ctags-5.6.tar.gz; cd ctags-5.6; ./configure --prefix=$$HOME; make; make install; cd -; rm -rf ctags-5.6

.PHONY: install.ohmyzsh
install.ohmyzsh:
	@ curl -Lo install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
	@ sh install.sh
	@ sed -i '/ZSH_THEME="/c\ZSH_THEME="lukerandall"' $$HOME/.zshrc

.PHONY: all
all:
	@ make install.ctags
	@ make install.miniconda3
	@ echo export PATH=$$HOME/miniconda3/bin:'$$PATH' >> $$HOME/.bashrc; source $$HOME/.bashrc
	@ make install.conda.tools
	@ make install.vimrc.with.plug
	@ mkae install.ohmyzsh
	@ source $$HOME/.vim/plugged/fzf/shell/completion.zsh
	@ source $$HOME/.vim/plugged/fzf/shell/key-bindings.zsh
