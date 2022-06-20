if [[ -f "/usr/bin/apt-get" ]]; then
  #install vim 8.2
  sudo add-apt-repository ppa:jonathonf/vim
  sudo apt update
  sudo apt install vim
  #install sort of new cmake for ycm 
  sudo apt remove --purge --auto-remove cmake
  sudo apt update && \
  sudo apt install -y software-properties-common lsb-release && \
  sudo apt clean all
  wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null
  sudo apt-add-repository "deb https://apt.kitware.com/ubuntu/ $(lsb_release -cs) main"
  sudo apt update
  sudo apt install kitware-archive-keyring
  sudo rm /etc/apt/trusted.gpg.d/kitware.gpg
  sudo apt update
  sudo apt install cmake
fi

# install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#YCM

vim +PlugInstall +qall

if [[ $OSTYPE == 'darwin'* ]]; then
  brew install cmake python go nodejs
  cd ~/.vim/plugged/YouCompleteMe
  python3 install.py --clangd-completer
# Ubuntu/Debian
elif [[ -f "/usr/bin/apt-get" ]]; then
  sudo apt -y install build-essential
  sudo apt -y install gcc-7 g++-7 gcc-8 g++-8 

  sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 7
  sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 7
  sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 8
  sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 8

  sudo apt install -y build-essential python3-dev 
  sudo update-alternatives --set gcc /usr/bin/gcc-8
  sudo update-alternatives --set g++ /usr/bin/g++-8
  cd ~/.vim/plugged/YouCompleteMe

  python3 install.py --clangd-completer
  
  sudo update-alternatives --set gcc /usr/bin/gcc-7
  sudo update-alternatives --set g++ /usr/bin/g++-7
fi  
