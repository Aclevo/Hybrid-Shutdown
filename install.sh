#!/bin/sh

# Bash, like C++, reads top to bottom
# Therefore the functions must be created first.

# This function checks dependencies

check_dependencies() {
    if ! find &> /dev/null; then
    echo "You need to install find to use this script."
    exit 1
fi

if ! systemctl &> /dev/null; then
    echo "These scripts only work on systems with SystemD."
    exit 1
fi

}

check_dependencies



# Installs the program into /etc/systemd/system

install() {
    find . -iname "hybrid-shutdown*.target" | xargs cp -t /etc/systemd/system
}

remove() {
    find /etc/systemd/system -iname "hybrid-shutdown*.target" | xargs rm
}

# Prints the help command

print_help() {
    echo """Hybrid Shutdown SystemD Service Installer:

--install: Installs the program into /etc/systemd/system
--remove: Removes the program from /etc/systemd/system
--help: Prints this help command
    """
}

if [[ $EUID -ne 0 ]]; then
    echo "This script needs to be run as root. Try using sudo/doas."
    exit 2
fi

if [ $# -eq 0 ]; then
    print_help
    exit 1
fi

# Checking dependencies


while ! [ $1 = "" ]; do
    case $1 in
        --install)
            install
            echo "Installation completed."
            echo "TODO - Tell user to run appropriate command"
            exit 0
    ;;
        --help)
            print_help
            exit 1
    ;;
        *)
            echo "Bad Command. Type --help for help"
            exit 1
    ;;
    esac
    shift
    done



