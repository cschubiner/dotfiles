dotfiles
========

Dotfiles for zsh and vim

###Installation
Run the following commands in your terminal

    cd ~
    echo "Installing Oh-My-Zsh"
    git clone git://zsh.git.sf.net/gitroot/zsh/zsh
    curl -L http://install.ohmyz.sh | sh
    
    echo "Installing Vim plugins"
    mkdir -p ~/.vim/autoload ~/.vim/bundle; \
    curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim;

    echo "Cloning Clay Schubiner dotfiles"
    git clone https://github.com/cschubiner/dotfiles.git clay_schubiner_dotfiles
    mv .zshrc BACKUP_ZSHRC
    mv .vimrc BACKUP_VIMRC
    ln -s clay_schubiner_dotfiles/.zshrc .zshrc
    ln -s clay_schubiner_dotfiles/.vimrc .vimrc
    source ~/.zshrc
    zsh
    echo "Done!"
    


If you're using Windows, change all occurrences of `~/.vim` to `~\vimfiles`.

You're done!

###Permanently switch shells
If you like this configuration, you can permanently switch to your new zsh shell by running:
```
chsh -s /bin/zsh
```
### Updating

Run the following commands to update your configuration:

```
cd ~/clay_schubiner_dotfiles
git pull
```
