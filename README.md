# dotfiles

```shell
sudo pacman -S --needed git base-devel && git init -b main -q && git remote add origin https://github.com/ealexandrohin/dotfiles.git && git fetch origin && git reset --hard origin/main && git branch -u origin/main && git submodule update --init && chmod +x setup.sh && ./setup.sh
```
