## Installation
1. make install.miniconda3
2. restart terminal
3. make all
4. make config.zsh
5. restart terminal
## NOTE
1. When you run make install.miniconda3, it will install miniconda and add $$HOME/miniconda3/bin to the end of your environment PATH. 
2. When you run make config.tmux (part of make all), it will backup your .tmux.conf to .tmux_bk.conf and copy a new .tmux.conf to your home dir.
3. When you run make install.vimrc.with.plug, it will backup your .vimrc to .vimrc_bk and copy a new .vimrc to your home dir. Moreover, it will install some vim plugins. 
4. When you run make config.zsh, it will add a alias to your .zshrc (alias vim=/miniconda3/bin/vim) because the vim autocompletion tool (deoplete) requires VIM >= 8.0.
