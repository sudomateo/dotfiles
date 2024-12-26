# X keyboard extension (XKB) Configuration

This configuration is used to modify how keyboards behave. The primary goal
is to _never_ modify system configuration and instead modify it via user
configuration. The secondary goal is to get the function keys `FK13` to `FK24`
sending `F13` to `F24` instead of something silly like `XF86Tools`.

## Resources

These resources have been quite helpful in figuring out how this stuff works.

- [`libxkbcommon` User Configuration](https://xkbcommon.org/doc/current/user-configuration.html)
- [User-specific XKB configuration - part 1](https://who-t.blogspot.com/2020/02/user-specific-xkb-configuration-part-1.html)
- [User-specific XKB configuration - part 2](https://who-t.blogspot.com/2020/07/user-specific-xkb-configuration-part-2.html)
- [User-specific XKB configuration - part 3](https://who-t.blogspot.com/2020/08/user-specific-xkb-configuration-part-3.html)
- [User-specific XKB configuration - putting it all together](https://who-t.blogspot.com/2020/09/user-specific-xkb-configuration-putting.html)
- [Wayland change your keyboard layout with xkb and gnome tweaks](https://youtu.be/utqpa_8SXkA)

## Usage

This user configuration is automatically loaded via
[`libxkbcommon` user-configuration](https://xkbcommon.org/doc/current/user-configuration.html)
but the compositor must still be configured to use it.

Ensure the `$XDG_CONFIG_HOME/xkb` directory contains the desired files and
directories.

```sh
$XDG_CONFIG_HOME/xkb
├── compat
├── keycodes
├── rules
│   ├── evdev
│   └── evdev.xml
├── symbols
│   └── sudomateo
└── types
```

Then enable the options in your compositor.

### GNOME

Enable custom options.

```
gsettings set org.gnome.desktop.input-sources xkb-options "['sudomateo:function_keys']"
```

Disable custom options.

```
gsettings reset org.gnome.desktop.input-sources xkb-options
```
