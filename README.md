# Hybrid-Shutdown

This software aims to emulate the Windows feature known as Quick Startup by placing the computer in a hibernated state while shutting down userspace.

**__This software should not be used in production!__**

### Installation:

To install the software, do ```sudo sh ./install.sh --install```. This will copy the target files in the repository to /etc/systemd/system. Root permissions are required to write to this directory.

### Update:

The script does not currently have an update function. It is recommended to uninstall the software and then install the software again. If the installation script successfully overwrites the files in the specified directory without uninstalling it first, please open an issue on GitHub.

### Uninstallation:

While the install script is incomplete, the required piece of the script can be found in the remove() function. Copy the code present into the terminal, and run the command as root. On most systems, just add 'sudo' remove the command 'xargs' and be sure there is a space between both words.


## License

This software is licensed under the GPLv3 (General Public License Version 3). The license can be found in LICENSE.