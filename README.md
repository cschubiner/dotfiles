dotfiles
========

Dotfiles for zsh and vim

##Installation
Run the following commands in your terminal

    cd ~
    echo "Installing Oh-My-Zsh"
    git clone git://zsh.git.sf.net/gitroot/zsh/zsh
    wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
    chsh -s /bin/zsh
    
    echo "Installing Vim plugins"
    mkdir -p ~/.vim/autoload ~/.vim/bundle; \
    curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim;
    wget -O ~/.vimrc https://raw.github.com/cschubiner/vim-settings/master/.vimrc
    
    echo "Cloning Clay Schubiner dotfiles"
    git clone https://github.com/cschubiner/dotfiles.git clay_schubiner_dotfiles
    cp ~/clay_schubiner_dotfiles/.vimrc ~
    cp ~/clay_schubiner_dotfiles/.zshrc ~
    source ~/.zshrc


If you're using Windows, change all occurrences of `~/.vim` to `~\vimfiles`.

You're done!
