#!/usr/bin/env python3

"""Utility script for provisioning a new development machine."""

import argparse
import functools
import logging
import os

_DOTFILES = ['.bash_profile', '.bashrc', '.clang-format', '.gitconfig', '.tmux.conf', '.vimrc']
_CFG_DIR = os.getcwd()
_HOME_DIR = os.path.expanduser('~')


def create_symlinks(force: bool) -> None:
    for dotfile in _DOTFILES:
        dotfile_path = os.path.join(_CFG_DIR, dotfile)
        symlink_path = os.path.join(_HOME_DIR, dotfile)

        if not os.path.exists(dotfile_path):
            logging.error("Configuration file '%s' does not exist.", dotfile_path)
            continue

        create_symlink = False

        if os.path.exists(symlink_path):
            if not os.path.islink(symlink_path):
                logging.error("File '%s' already exists, but is not a symbolic link.", symlink_path)
                continue

            if force:
                os.unlink(symlink_path)
                create_symlink = True
        else:
            create_symlink = True

        if create_symlink:
            os.symlink(dotfile_path, symlink_path)
            logging.info("Created symbolic link '%s' -> '%s'.", symlink_path, dotfile_path)


if __name__ == '__main__':
    logging.basicConfig(
        level=logging.INFO, format='%(asctime)s - %(message)s', datefmt='%Y-%m-%d %H:%M:%S'
    )

    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        '-f',
        '--force',
        action='store_true',
        default=False,
        help='Force recreation of symbolic links if they already exist.',
    )
    parser.add_argument(
        '-d',
        '--dry-run',
        action='store_true',
        default=False,
        help='Only log modifying system commands instead of executing them.',
    )
    args = parser.parse_args()

    def _dry_run_patch(func):
        @functools.wraps(func)
        def _wrapper(*args, **kwargs):
            logging.info(
                "DRY RUN: '%s' invoked with args='%s', kwargs='%s'.", func.__name__, args, kwargs
            )

        return _wrapper

    if args.dry_run:
        os.symlink = _dry_run_patch(os.symlink)
        os.unlink = _dry_run_patch(os.unlink)

    create_symlinks(args.force)
