#!/usr/bin/env bash

function main()
{
    clear
    printf $(tput clear)
    matrix
}

function matrix()
{
    # declare -a _LET=($(awk 'BEGIN{for(i=32;i<127;i++)printf "%c\n",i}'))
    declare -a _LET=($(awk 'BEGIN{for(i=128;i<1200;i++)printf "%c\n",i}'))
    COL=$(tput cols)
    LINE=$(tput lines)
    SETAF="255"
    while true
    do
        MOD=${#_LET[*]}
        INDEX=$(($RANDOM%$MOD))
        _R_COL=$(($RANDOM%$COL))
        _R_LINE=$(($RANDOM%$LINE))
        _COLOR=$(($RANDOM%$SETAF))

        tput cup ${_R_LINE} ${_R_COL}
        tput setaf ${_COLOR}
        printf "%s" "${_LET[$INDEX]}"
        sleep .001
    done
}

main
