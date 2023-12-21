## pop-kde-script
A Simple script to move pop_OS 22.04 from Gnome to KDE Plasma


Please make sure your system is up to date before installing.

# Steps

1. Download the script
2. Open terminal and cd to directory you downloaded it to
3. Run script
4. (You may have to hard reset your computer as once gdm is removed the screen goes black. I would wait just a couple of minutes past where the screen goes black)

# After Reboot

After reboot you should be presented with the sddm log-in screen. I would open konsole and run a quick 'sudo apt auto-remove' to clean up the underlying system

Enjoy KDE!

Also if you would prefer a much more current KDE Plasma 5 desktop consider running the [Kubuntu Backports ppa](https://kubuntu.org/news/plasma-5-27-lts-for-jammy-22-04-lts-available-via-ppa/) 


sudo add-apt-repository ppa:kubuntu-ppa/backports-extra && sudo apt full-upgrade -y



# Issues?

If you run into any issues please do not expect System76 or the greater pop_OS community to be able to help you. This greatly breaks from the main pop_OS distribution.
If you would like to help with this script, or know how to solve some of the paper cuts with the install I welcome any advice or PRs
