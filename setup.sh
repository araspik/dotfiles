#!/bin/bash

#   Setup Script
# ================
# For whenever my stuff f*cks itself.

PROGPATH=$(type -p $0)
SOURCE=$(realpath $(dirname $PROGPATH))
TARGET=$HOME
VERBOSE=0
OVERWRITE=0
INSTALL_ZSH=0
INSTALL_ALL=1

# Parsing command-line arguments
# ==============================
# Based on https://stackoverflow.com/a/14203146/9781227
while [[ $# -gt 0 ]]; do case "$1" in 
    -h|--help)
        echo "ZSh Configuration Installer: $(basename $PROGPATH) [options...] [objects]"
        echo
        echo "  Installs various selectable configuration items into a target directory."
	echo "  Unless an object(s) is specified, all installable objects are installed."
        echo
        echo "Objects (invertible with \"no-\" prefix):"
        echo "  zsh         ZSh configuration as well as DIRCOLORS."
        echo
        echo "Options:"
        echo "  -h      --help          This help message."
        echo "  -t PATH --target PATH   Installs to PATH (default is HOME, \"$TARGET\")."
        echo "  -s PATH --source PATH   Installs to script directory (detected \"$SOURCE\")."
        echo "  -o      --overwrite     Overwrite any conflicting files in the target directory."
        echo "  -v      --verbose       Provides verbose messaging."
        exit 0 ;;
    -t|--target)
        TARGET="$2"
        shift 2 ;;
    -s|--source)
        SOURCE="$2"
        shift 2 ;;
    -o|--overwrite)
        OVERWRITE=1
        shift ;;
    -v|--verbose)
        VERBOSE=1
        shift ;;
    zsh)
        INSTALL_ZSH=1
	INSTALL_ALL=0
        shift ;;
    no-zsh)
        INSTALL_ZSH=0
	INSTALL_ALL=0
        shift ;;
    *)
        echo "WARNING: Argument \"$1\" not recognized!" >&2
        shift ;;
esac; done

# Checking command-line arguments
# ===============================
if [[ ! -d "$SOURCE" ]]; then
    echo "ERROR: Source directory \"$SOURCE\" is not a directory!" >&2
    exit 1
elif [[ ! -d "$TARGET" ]]; then
    echo "ERROR: Target directory \"$TARGET\" is not a directory!" >&2
    exit 1
fi

# Printing command-line arguments
# ===============================
function stringify_bool() {
    [ $1 -eq 0 ] && echo "no" || echo "yes"
}
if [[ $VERBOSE -eq 1 ]]; then
    echo "Arguments:"
    echo "  SOURCE: \"$SOURCE\""
    echo "  TARGET: \"$TARGET\""
    echo "  OVERWRITE: $(stringify_bool $OVERWRITE)"
    echo "  VERBOSE: yes"
    echo "  INSTALL_ZSH: $(stringify_bool $INSTALL_ZSH)"
fi

# Linker function
# ===============
# Checks for overwriting and stuff.
function link_path() {
    src=$1
    tgt=$2
    name=$3

    echo -n "  Linking $name... "
    if [[ ! -e $src ]]; then
        echo "not found!"
        echo "ERROR: Path \"$src\" to be linked did not exist!" >&2
        echo "  This is probably due to a corrupt/invalid SOURCE (\"$SOURCE\")" >&2
        exit 1
    elif [[ -e $tgt ]]; then
        if [[ $OVERWRITE -eq 1 ]]; then
            echo -n "overwriting... "
            output=$(ln -sf $src $tgt 2>&1)
            if [[ ! $? -eq 0 ]]; then
                echo "failed!"
                echo $output >&2
            else
                echo "done"
            fi
        else
            echo "not overwriting"
        fi
    else
        output=$(ln -s $src $tgt 2>&1)
        if [[ ! $? -eq 0 ]]; then
            echo "failed!"
            echo $output >&2
        else
            echo "done"
        fi
    fi
}

if [[ $INSTALL_ZSH -eq 1 ]] || [[ $INSTALL_ALL -eq 1 ]]; then
    echo "Installing ZSh Configuration:"

    # Linking DIRCOLORS
    link_path "$SOURCE/zsh/theme/DIRCOLORS" "$TARGET/.dir_colors" "DIRCOLORS file"

    # Linking ZSh config file
    link_path "$SOURCE/zsh/primary.zsh" "$TARGET/.zshrc" "ZSh Config"
fi
