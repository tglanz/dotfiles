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

### Disable touchscreen

**X11**

Use `xinput list` to identify the touch screen device. Usually it should be found under _Virtual core pointer_, and by process of elimination we can narrow the specific device.

Before making permanent configuration, assuming the device id is 123, check if disabling it actually disables the touch screen by

    xinput disable 123

Now, enable it again with

    xinput enable 123

Assuming the name of the device is _SomeDevice_, we want to create a configuration that tells X11 to ignore this device.

The configruations are most likely at `/etc/X11/xorg.conf.d`. Add a conf there such as `99-disable-touchscreen.conf` with the contents:

    Section "InputClass"
        Identifier "Disable touchscreen"
        MatchProduct "SomeDevice"
        Option "Ignore" "on"
    EndSection

Now enjoy without this stupid touch screen.
