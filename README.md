# Mac Configuration

#### xcode
- 安装`xcode command line tools`:  
`xcode-select --install`

#### homebrew
- 安装`homebrew`  
`ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
- 安装`homebrew cast`  
`brew install caskroom/cask/brew-cask`

#### zsh
- 将默认shell切换为`zsh`  
`chsh -s /bin/zsh`
- 运行命令安装`Oh My ZSH!`  
`sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

#### MacVim
- 将`vimrc`命名为`.vimrc`并放在 `~/` 下
- 然后安装`vundle`  
`$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
- 运行`vim`并执行`:PluginInstall`
