# dotfiles

### alex

```shell
sudo pacman -S --needed git base-devel && git init -b main -q && git remote add origin https://github.com/ealexandrohin/dotfiles.git && git fetch origin && git reset --hard origin/main && git branch -u origin/main && git submodule update --init && chmod +x install.sh && ./install.sh
```

### work

```shell
git init -b work -q && git remote add origin https://github.com/ealexandrohin/dotfiles.git && git fetch origin && git reset --hard origin/work && git branch -u origin/work && git submodule update --init
```

---

```shell
chmod +x setup.sh && ./setup.sh
```

---

```shell
chmod +x work.sh && ./work.sh
```
