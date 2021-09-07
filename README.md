```
    ,
   /-\---------------------------------------
  //_\\   Argon - The Noble Package Manager  \
 /// \\\---------------------------------------
/.-' '-.\
```

Introduction
------------

Argon is a lightweight GUI package manager for Arch Linux, featuring:

  * package installation/removal and system update
  * configurable update notifier
  * full AUR support 

Argon, which strikes a balance between the raw command line and the opulence of full-featured GUI package managers, is available from the [Arch User Repository](https://aur.archlinux.org/packages/argon/).

Why "Argon"? Because if you "package" Argon in a tube, you can electrify it to get something like [Arch Linux blue](https://commons.wikimedia.org/wiki/File:ArTube.jpg).

Main Window
-----------

From the main window you can install/remove packages, launch the update notifier configuration window, view a list of your system's top-level packages, and update the system.

"Top-level packages" are packages that don't serve as dependencies for any other installed packages. The top-level package list may be thought of as the "chemical formula" for your personal version of Arch Linux. (Top-level packages from the "base" and "base-devel" groups are filtered out, since these comprise the core Arch installation, and are thus not distinctive to your system.)

For the sake of a tidy overview, you may wish to customize the top-level package list. For instance, if you install the infinality-bundle-fonts group, dozens of fonts will show up as top-level packages; you might want to replace this unwieldy list with a single entry (e.g. "infinality-bundle-fonts" or "fonts from the infinality bundle"). Remove entries from the top-level package list by adding them (one per line) to `~/.config/argon/top-remove`; likewise, add entries to the top-level package list with `~/.config/argon/top-add`.

![Main screen](https://raw.githubusercontent.com/14mRh4X0r/arch-argon/master/screenshots/argon-main.jpg)
![Terminal](https://raw.githubusercontent.com/14mRh4X0r/arch-argon/master/screenshots/argon-terminal.jpg)
![Package List](https://raw.githubusercontent.com/14mRh4X0r/arch-argon/master/screenshots/argon-list.jpg)

Notifier Configuration
----------------------

From the notifier configuration window you can set update check delays and notification text/icons. In some desktop environments, you can also enable the update notifier with the "Enable Autostart" button. This will add the update notifier to your startup applications, causing it to run in the background the next time you log in.

The "Enable Autostart" button works in any desktop environment that recognizes .desktop files in the `~/.config/autostart` directory (e.g. GNOME, KDE, Xfce, LXDE). To enable the notifier in other desktop environments, use an external method to add `/usr/bin/argon-notifier` to your startup applications.

If no popup notifications are appearing, make sure you have a [notification server](http://wiki.archlinux.org/index.php/Desktop_Notifications) installed.

When setting the notification text, bear in mind that the string "NUM" will be converted to the number of available updates, while "UPD" will be converted to either the word "update" (if exactly 1 update is available) or "updates". Thus, "NUM system UPD available" becomes (for instance) "1 system update available" or "8 system updates available".

![Autostart configuration](https://raw.githubusercontent.com/14mRh4X0r/arch-argon/master/screenshots/argon-autostart.jpg)
![Up-to-date notification](https://raw.githubusercontent.com/14mRh4X0r/arch-argon/master/screenshots/argon-fresh.jpg)
![Updates available notification](https://raw.githubusercontent.com/14mRh4X0r/arch-argon/master/screenshots/argon-stale.jpg)

Light Desktop Environments
--------------------------

To provide an alternative to popups, Argon's notifications are written to `/etc/argon/message`, where they can be easily accessed by user-made scripts. This is handy in lightweight desktop environments, where popups may be unsupported.

The dwm window manager, for instance, can place Argon's output in the status bar with the following `~/.xinitrc` code:

```bash
while true; do
argon=$(</etc/argon/message)
xsetroot -name "$argon"
sleep 1
done &
```

For aesthetics, it is recommended to set Argon as a floating application in tiling environments. In dwm, this would entail the following `config.h` code:

```c
static const Rule rules[] = {
        /* class      instance    title       tags mask     isfloating   monitor */
        { "Argon",     NULL,       NULL,       0,            True,        -1 
},
};
```

Here's a sample notifier configuration with the "system is up to date" message left blank...
![Up-to-date on dwm](https://raw.githubusercontent.com/14mRh4X0r/arch-argon/master/screenshots/argon-dwm-fresh.jpg)
...and an "updates available" message that appears on the left side of the status text.
![Updates available on dwm](https://raw.githubusercontent.com/14mRh4X0r/arch-argon/master/screenshots/argon-dwm-stale.jpg)

Powered By...
-------------

Argon uses pacman and [pacaur](https://aur.archlinux.org/packages/pacaur/) (which extends the functionality of pacman to the AUR) for package processing, checkupdates (a script included with pacman) and [auracle](https://aur.archlinux.org/packages/auracle-git/) to check for updates, and libnotify to send notifications.

Commands
--------

Argon's features can be divided into two kinds: system-altering (install, remove, update) and informational (top-level package list, update notifications). The exact commands performed by the system-altering features are:

  * package installation: `pacaur -S`
  * package removal: `pacaur -Rs`
  * system update: `pacaur -Syu` 

Note that the second command, in addition to removing the requested package, also removes dependencies of that package not required by any other packages on the system.

Bonus
-----

[GNOME 3 Arch Linux "Activities hot corner" icon](https://raw.githubusercontent.com/14mRh4X0r/arch-argon/master/icons/arch-gnome.png), for use with the [activities configurator extension](https://extensions.gnome.org/extension/358/activities-configurat).
