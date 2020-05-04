```
sudo apt install zsh
sudo apt install tmux
sudo apt install neovim
sudo apt install silversearcher-ag
sudo apt install git
sudo apt install curl
```

- Install alacritty

``` 
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt install alacritty
```
- Install oh-my-zsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

- Install powerlevel10k

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```

- Install zsh-syntax-highlighting

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

- Install zsh-autosuggestions

```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

- Install zsh-auto-completions

```
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
```

- Install Vundle

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
```

- Docker

```
sudo apt install docker.io
sudo systemctl enable --now docker
sudo usermod -aG docker $USER
```

- Lazygit

```
sudo add-apt-repository ppa:lazygit-team/release
sudo apt-get update
sudo apt-get install lazygit
```

- Use Alacritty as default terminal (Ctrl + Alt + T)
```
gsettings set org.gnome.desktop.default-applications.terminal exec 'alacritty'
```

# Terminal config
- Text: #CDE0E3
- Background: #333333
- Cursor color: #030000 #C7C7C7

# Setup for web dev

- Config Vim

```
CocInstall coc-tsserver coc-json coc-css coc-highlight coc-html coc-angular
```

- Angular

```
npm install -g @angular/cli
npm install -g prettier
```
