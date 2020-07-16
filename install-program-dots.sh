#!/bin/bash

# Report help screen
usage()
{
    echo "usage: install-program-dots.sh [[program [--merge-tags \"tag1, tag2\"]] | [--help]]" && exit
}
[ $# -eq 0 ] && usage
[ $1 = "-h" ] || [ $1 = "--help" ] && usage

# Parse parameters
program=$1 && shift
while [ "$1" != "" ]; do
    case $1 in
        -m | --merge-tags ) shift && tags=$1;; # tags need to be separated by comma!
        -h | --help )       usage;;
        *)                  echo "Error: unknown parameter \"$1\"!";;
    esac
    shift
done

[ -d "${program}" ] && cd "${program}" || { echo "Error: program \"${program}\" does not exist!" && exit 1; }

# Find all files in program folder, but exclude folder with tags ("@")
source_dotfiles=$(find . -type f ! -name *@*)

for source_dotfile in ${source_dotfiles}; # attention: not whitespace safe
do
    target_dotfile="${HOME}/${source_dotfile:2}"
    target_dir=$(dirname ${target_dotfile})

    [ ! -d "${target_dir}" ] && mkdir -p "${target_dir}"

    cp -v "${source_dotfile}" "${target_dotfile}"

    for tag in ${tags};
    do
        if [ -f "${source_dotfile}@${tag}" ]; then
            cat "${source_dotfile}@${tag}" >> "${target_dotfile}"
            echo "add tag \"${source_dotfile}@${tag}\" to \"${target_dotfile}\""
        fi
    done
done
