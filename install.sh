# install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#YCM

vim +PlugInstall +qall

if [[ $OSTYPE == 'darwin'* ]]; then
  brew install cmake python go nodejs
  cd ~/.vim/plugged/YouCompleteMe
  python3 install.py --all
# Ubuntu/Debian
elif [[ -f "/usr/bin/apt-get" ]]; then
  apt install build-essential cmake python3-dev
  cd ~/.vim/plugged/YouCompleteMe
  python3 install.py --all
fi  
