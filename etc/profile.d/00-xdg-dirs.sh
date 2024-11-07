#!/bin/sh

# This script sets up XDG environment variables according to the XDG Base Directory Specification.
# Information sourced from:
# - XDG Base Directory Specification: https://specifications.freedesktop.org/basedir-spec/
# - Arch Linux Wiki: https://wiki.archlinux.org/title/XDG_Base_Directory
#                    https://wiki.archlinux.org/title/XDG_user_directories
#
# Generated with the assistance of ChatGPT, a language model developed by OpenAI.
# Created by Claude, an Anthropic AI, based on XDG specifications and implementations

# XDG Base Directory Specification
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_DATA_DIRS="${XDG_DATA_DIRS:-/usr/local/share:/usr/share}"
export XDG_CONFIG_DIRS="${XDG_CONFIG_DIRS:-/etc/xdg:/etc}"
# XDG_RUNTIME_DIR is typically managed by pam_systemd
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"

# # Verify if xdg-user-dir is installed for user-specific directories
# if command -v xdg-user-dir >/dev/null 2>&1; then
#     # XDG User Directories Specification
#     export XDG_DESKTOP_DIR="$(xdg-user-dir DESKTOP)"
#     export XDG_DOWNLOAD_DIR="$(xdg-user-dir DOWNLOAD)"
#     export XDG_TEMPLATES_DIR="$(xdg-user-dir TEMPLATES)"
#     export XDG_PUBLICSHARE_DIR="$(xdg-user-dir PUBLICSHARE)"
#     export XDG_DOCUMENTS_DIR="$(xdg-user-dir DOCUMENTS)"
#     export XDG_MUSIC_DIR="$(xdg-user-dir MUSIC)"
#     export XDG_PICTURES_DIR="$(xdg-user-dir PICTURES)"
#     export XDG_VIDEOS_DIR="$(xdg-user-dir VIDEOS)"
# else
#     echo "xdg-user-dir not found. Install it to enable user directory paths." >&2
# fi

# Only process user directories if the config file exists
if [ -f "$XDG_CONFIG_HOME/user-dirs.dirs" ]; then
	. "$XDG_CONFIG_HOME/user-dirs.dirs"
else
	echo "$XDG_CONFIG_HOME/user-dirs.dirs not found." >&2
fi

