# Yalishanda's .files

## Why?
Because I am a try-hard and want an easy-peasy-hacky setup on every machine.

## How?
1. Install needed `zsh` framework, plugins and themes:
- [Oh-My-Zsh!](https://github.com/robbyrussell/oh-my-zsh)
- [Synthax Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [Spaceship Theme](https://github.com/denysdovhan/spaceship-prompt)
- [Fish-like Autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

2. Install (Fira Code || Powerline) fonts:
- [FIRA CODE](https://github.com/tonsky/FiraCode)
- [Powerline Fonts](https://github.com/powerline/fonts/tree/master/SourceCodePro)

3. Make sure `zsh` is the default shell if not prompted to change it already:
- For normal user: `chsh -s /bin/zsh`
- For root: `sudo chsh -s /bin/zsh`

4. Use the repo:
```bash
git clone https://github.com/allexks/dotfiles
cp dotfiles/.* ~
sudo ln -s ~/.zshrc ~root/.zshrc  # only if you wanna change root shell as well
```
## Collection of unnecessary but cool stuff
- [lolcat](https://github.com/busyloop/lolcat)
- [tldr](https://github.com/tldr-pages/tldr)
- [cheat](https://github.com/cheat/cheat)
