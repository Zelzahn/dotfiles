# dotfiles
## Setup
1. Follow [Arch & i3 install guide](https://gist.github.com/fjpalacios/441f2f6d27f25ee238b9bfcb068865db)
2. Instead of `arc-gtk-theme` install `yay -S gtk-theme-solarc-git`
3. The LightDM configuration then becomes:
```
[greeter]
theme-name = SolArc
icon-theme-name = Papirus
background = #2f343f
xft-antialias=1
xft-dpi=240
xft-hintstyle=hintfull
xft-rgba=rgb
```
4. Run `chezmoi init --apply https://github.com/Zelzahn/dotfiles.git`

## Stack
OS: Arch Linux
DE: i3
Terminal: Kitty
