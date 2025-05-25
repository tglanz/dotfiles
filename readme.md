# dotfiles

## Remember these executables

- [autorandr](https://github.com/phillipberndt/autorandr)

## Hacks

### Zsh word navigation

Ctrl-{arrow} and Home/End not working as expected.
To fix this we should add to the `~/.zshrc` the following

    bindkey "^[[1;5C" forward-word
    bindkey "^[[1;5D" backward-word
    bindkey  "^[[H"   beginning-of-line
    bindkey  "^[[F"   end-of-line
