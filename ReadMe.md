# Personal dotfiles

## Colorscheme: [vn-night](https://github.com/nxvu699134/vn-night.nvim)

![image](https://github.com/nxvu699134/dotFileUbuntu/blob/master/screenshot.png)


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
