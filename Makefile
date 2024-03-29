.PHONY: install.miniconda3
install.miniconda3:
	# @ echo export PATH='$$PATH':$$HOME/miniconda3/bin >> $$HOME/.bashrc
	@ wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
	@ bash Miniconda3-latest-Linux-x86_64.sh

.PHONY: install.nvim
install.nvim:
	@ curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage && \
		chmod u+x nvim.appimage && \
		cp nvim.appimage $$(dirname $$(which conda))/nvim

.PHONY: install.conda.tools
install.conda.tools:
	@ conda install -y -c conda-forge \
		tmux vim cmake git gdb
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

.PHONY: config.zsh
config.zsh:
	@ sed -i '/ZSH_THEME="/c\ZSH_THEME="lukerandall"' $$HOME/.zshrc
	@ sed -i '/plugins=(git)/c\plugins=(git autojump)' $$HOME/.zshrc
	@ echo source $$HOME/.vim/plugged/fzf/shell/completion.zsh >> $$HOME/.zshrc
	@ echo source $$HOME/.vim/plugged/fzf/shell/key-bindings.zsh >> $$HOME/.zshrc
	@ echo alias vim='$$HOME/miniconda3/bin/vim' >> $$HOME/.zshrc
	@ echo alias gdb='$$HOME/miniconda3/bin/gdb' >> $$HOME/.zshrc
	@ echo exec zsh >> $$HOME/.bashrc


.PHONY: install.autojump
install.autojump:
	@ git clone https://github.com/wting/autojump.git; cd autojump; ./install.py; cd ..; rm -rf autojump
	@ echo '[[ -s $$HOME/.autojump/etc/profile.d/autojump.sh ]] && source $$HOME/.autojump/etc/profile.d/autojump.sh' >> $$HOME/.bashrc

.PHONY: config.tmux
config.tmux:
	@ cp $$HOME/.tmux.conf $$HOME/.tmux_bk.conf; cp .tmux.conf $$HOME/.
	#@ tmux source-file ~/.tmux.conf

.PHONY: install.fzf
install.fzf:
	@ git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	@ ~/.fzf/install

.PHONY: all
all:
	@ make install.conda.tools
	@ make install.ctags
	@ make install.vimrc.with.plug
	@ make config.tmux
	@ make install.autojump
	@ make install.ohmyzsh
	@ make install.fzf
