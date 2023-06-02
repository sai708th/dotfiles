mkdir ~/Dev/Projects
mkdir ~/Dev/Projects/Developing
mkdir ~/Dev/Projects/MyLibrary

cd
ln -s ~/Dev/dotfiles/_gitconfig    .gitconfig
ln -s ~/Dev/dotfiles/_bash_profile .bash_profile
ln -s ~/Dev/dotfiles/_bashrc       .bashrc
ln -s ~/Dev/dotfiles/_tmux.conf    .tmux.conf
ln -s ~/Dev/dotfiles/_zshrc        .zshrc


if [ `which brew` ]; then
    echo 'brew found'
else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install neovim
brew install tmux
brew install zsh

brew install node
brew install python3

pip3 install neovim
pip3 install pynvim

brew install deno
brew install ripgrep

brew install tree
brew install coreutils
brew install colordiff

brew install universal-ctags
mkdir ~/.ctags.d
cd    ~/.ctags.d
ln -s ~/Dev/dotfiles/configure.ctags configure.ctags

#$XDG_HOME ga empty ja nakereba
if [ -n "$XDG_HOME" ]; then
    cd $XDG_HOME
    mkdir cache
    mkdir config
    mkdir runtime
    mkdir config/nvim
    cd config/nvim
    ln -s ~/Dev/dotfiles/init.vim
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

#SSH
mkdir -p ~/.ssh && cd ~/.ssh
ln -s ~/Dev/dotfiles/sshconfig config
ssh-keygen -f github -t rsa -N ""
ssh-keygen -f bitbucket -t rsa -N ""




