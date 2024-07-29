# pop-kde-script

[System76]: https://system76.com/
[Pop!_OS]: https://pop.system76.com/
[KDE]: https://kde.org/
[virt-manager]: https://virt-manager.org/

An experimental script to switch [System76]'s [Pop!_OS] Linux 22.04 to [KDE].

The default Pop!_OS desktop is a heavily customized version of Gnome. This script replaces it
with the latest KDE Plasma available in the Ubuntu repositories (5.24). For a more recent version,
please see [Later KDE Versions](#later-kde-versions) below.

> [!WARNING]
> **This script may break things!**

Report any problems you find on this repo. See [Issues](#issues) below for more information.

## Setup

### Pre-requisites

Make sure you have the following:

1. A reliable internet connection to download packages
2. The latest version of [Pop!_OS] (22.04)
3. The latest updates, either by running `sudo apt upgrade` or via the Pop Shop

### Running the install

1. Start a terminal session on the target system in one of the following ways:

   * Open a terminal window locally
   * Connect remotely via SSH or MUSH
   * For VM environments such as [virt-manager], use a virtual console

3. `cd` to directory you downloaded it to
4. Run the script
5. Wait for a few minutes as gdm (Gnome Display Manager) is replaced with sddm

If you aren't running the install remotely, the screen may go black. If this does not resolve after a
few minutes, you may need to reboot the system by using the power button.

### Post-Install
[scheduler integration plugin]: https://github.com/maxiberta/kwin-system76-scheduler-integration
After rebooting, you should be presented with an sddm log-in screen.

You may also want to take the following optional steps below.

#### Clean up old packages
[apt-mark]: https://manpages.ubuntu.com/manpages/jammy/man8/apt-mark.8.html

You can optionally free up disk space by removing old packages:

1. Open Konsole from the menu at the bottom left of the screen
2. Run `apt --dry-run autoremove` to check which packages will be auto-removed
3. Use [`sudo apt-mark`][apt-mark] to mark any you'd like to keep
4. Run `sudo apt autoremove` to begin cleanup

Depending on what you choose to keep, this can free up at least a few hundred MB
of disk space.

#### Install the System76 Scheduler Plugin for KDE
[System76 Scheduler]: https://github.com/pop-os/system76-scheduler
[kwin plugin]: https://github.com/maxiberta/kwin-system76-scheduler-integration

To maximize media and game performance, Pop!\_OS ships with:
* the [System76 Scheduler][]
* desktop integrations to tell the scheduler which application is important

Since you've replaced the desktop, you may need a KDE-specific
plugin to use the scheduler to the fullest. Install instructions
and source for one are located here:
https://github.com/maxiberta/kwin-system76-scheduler-integration

## Issues
[Pull requests]: https://github.com/DaisyLee2010/pop-kde-script/pulls
[Issue reports]: https://github.com/DaisyLee2010/pop-kde-script/issues

Pop!_OS offers optimizations other Linux distros do not.

This script may break or interfere with their underlying assumptions.

If you notice a problem or opportunity for improvement, please help fix it! This repo accepts:

* [Issue reports][]
* [Pull requests][]

Do not expect support from System76 or the general Pop!_OS community.

## Why?

These scripts revive an earlier experiment with converting Pop!_OS to use KDE as the default desktop. The project builds on the contributions of the following:

* [13r0ck](https://github.com/13r0ck) (mentorship and general expertise)
* [DaisyLee](https://github.com/DaisyLee2010) (packaging and testing)
* [dubsyGG](https://dubsy.dev/), (mockups and testing)
* [pushfoo](https://github.com/pushfoo) (research, testing, and documentation)

## Later KDE Versions
[known to break installs]: https://github.com/DaisyLee2010/pop-kde-script/issues/2

> [!WARNING]
> These are **[known to break installs][]** as of the last test!
> 
> We welcome [pull requests][Pull requests] to fix it.

### I'm brave!

If you still want to try to install a KDE Plasma 5 desktop than 5.24, the
[Kubuntu Backports ppa](https://kubuntu.org/news/plasma-5-27-lts-for-jammy-22-04-lts-available-via-ppa/)
may provide a foundation to start tinkering.

The following steps may help figure it out:

1. Be sure you can afford to lose or break the install you'll try this on
2. Run the following:
   ```
   sudo add-apt-repository ppa:kubuntu-ppa/backports-extra && sudo apt full-upgrade -y
   ```

Even if it doesn't break the install, later versions may also introduce
additional changes and install steps beyond those for KDE 5.24.
