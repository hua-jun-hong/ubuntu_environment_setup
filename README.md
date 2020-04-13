This script will setup an friendly environment for programmers. It will install (i) vim plugins, (ii) zsh, and (iii) tmux. The features and installation guides are given below:

## VIM Features
1. autocompletion
2. comment out selected visual block
3. navigate between functions & editing files
4. fuzzy search the text on your cursor
5. color coding pairs of your parentheses

## zsh Features
1. git branch & status
2. autojump plugin
3. ctrl+R fuzzy search

## tmux Configuration
1. change default key:
- ctrl+B -> ctrl+A
2. shortcuts
- ctrl+A - (horizontal split) 
- ctrl+A | (vertical split) 
- ctrl+A w (new window)
- ctrl+A #number (switch to window number #)
- ctrl+A z (toggle full screen)
- ctrl+X (rotating around split panes)
- ctrl+A , (rename your window)


## Installation
1. make install.miniconda3
2. restart terminal
3. make all
4. make config.zsh
5. restart terminal

## NOTE
1. When you run make install.miniconda3, it will install miniconda and add $$HOME/miniconda3/bin to the end of your environment PATH. 
2. When you run make config.tmux (part of make all), it will backup your .tmux.conf to .tmux_bk.conf and copy a new .tmux.conf to your home directory.
3. When you run make install.vimrc.with.plug, it will backup your .vimrc to .vimrc_bk and copy a new .vimrc to your home directory. Moreover, it will install some vim plugins. 
4. When you run make config.zsh, it will (i) add a alias to your .zshrc (alias vim=/miniconda3/bin/vim) because the vim autocompletion tool (deoplete) requires VIM >= 8.0. and (ii) add exec zsh in the end of your .bashrc.
