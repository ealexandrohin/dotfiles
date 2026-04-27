# dotfiles

```shell
sudo pacman -S --needed git base-devel && git init -q && git remote add origin https://github.com/ealexandrohin/dotfiles.git && git fetch origin && git reset --hard origin && git submodule update --init && chmod +x setup.sh && sudo setup.sh
```
