dotfiles
========

Dotfiles for zsh and vim

###Installation
Run the following commands in your terminal. Your existing vimrc and zshrc files (if they exist) will be backed up.

    cd ~
    echo "Installing Pretzo"
    zsh
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
      ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done

    echo "Installing Vim plugins"
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

    echo "Cloning Clay Schubiner dotfiles"
    git clone https://github.com/cschubiner/dotfiles.git ~/clay_schubiner_dotfiles
    mv -f ~/.zshrc BACKUP_ZSHRC
    mv -f ~/.vimrc BACKUP_VIMRC
    ln -s ~/clay_schubiner_dotfiles/.zshrc .zshrc
    ln -s ~/clay_schubiner_dotfiles/.vimrc .vimrc
    ln -s ~/clay_schubiner_dotfiles/.gitignore_global .gitignore_global
    ln -s ~/clay_schubiner_dotfiles/.zprezto .zprezto
    ln -s ~/clay_schubiner_dotfiles/.zpreztorc .zpreztorc

    cd ~
    ln -s ~/clay_schubiner_dotfiles/zsh_plugins  ~zsh_plugins
    rm -f ~/zsh_plugins/.DS_Store
    touch ~/zsh_plugins/my_zsh_config.sh
    source ~/.zshrc
    zsh
    cd ~

    echo "Configuring OSX"
    cd ~/clay_schubiner_dotfiles
    chmod 777 ./osx_config
    ./osx_config

    echo "Done!"

### Installing in Windows
If you're using Windows, change all occurrences of `~/.vim` to `~\vimfiles`.

### Installing in Linux/Ubuntu
    sudo apt-get install zsh
    sudo apt-get install git-core
    sudo wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
    sudo chsh -s `which zsh`

Then shutdown:

    sudo shutdown -r 0

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
