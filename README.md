# pop-kde-script

[System76]: https://system76.com/
[Pop!_OS]: https://pop.system76.com/
[KDE]: https://kde.org/
[virt-manager]: https://virt-manager.org/

An experimental script to switch [System76]'s [Pop!_OS] Linux 22.04 to [KDE].

The default Pop!_OS desktop is a heavily customized version of Gnome. This script replaces it
with the latest KDE Plasma available in the Ubuntu repositories (5.24). For a more recent version,
please see [Later KDE Versions](#later-kde-versions) below.

## Warning

**This script may break things!**

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

### Cleanup

After rebooting, you should be presented with an sddm log-in screen.

1. (Optional) Clean up old packages to free disk space:
   
   1. Open Konsole from the menu at the bottom left of the screen
   2. Run `sudo apt autoremove`

2. Enjoy KDE!

## Issues

Pop!_OS offers optimizations other Linux distros do not.

This script may break or interfere with their underlying assumptions.

If you notice a problem or opportunity for improvement, please help fix it! This repo accepts:

* Issue reports 
* Pull requests

Do not expect support from System76 or the general Pop!_OS community.

## Why?

This script revives an earlier experiment with convering KDE to Pop!_OS. It builds on the contributions of the following:

* [13r0ck](https://github.com/13r0ck) (expertise and mentorship)
* [DaisyLee](https://github.com/DaisyLee2010) (packaging and testing)
* [dubsyGG](https://dubsy.dev/), (mockups and testing)
* [pushfoo](https://github.com/pushfoo) (research and testing)

## Later KDE Versions

This currently does not work and **will** break you system completely.
Looking for help trying to solve this. 

If you prefer a later KDE Plasma 5 desktop than 5.24, consider running the
[Kubuntu Backports ppa](https://kubuntu.org/news/plasma-5-27-lts-for-jammy-22-04-lts-available-via-ppa/)
as follows:

```
sudo add-apt-repository ppa:kubuntu-ppa/backports-extra && sudo apt full-upgrade -y
```

In addition to breaking things the same way this script might, it may also introduce
further changes.
