#!/bin/bash

function check_one_git_status() {
    if [ -d "$1" ] ; then 
        #directory sonzai suru.
        local dotgit="$1/.git"
        if [ -e "$dotgit" ] ; then
            echo -e "\e[37;44;5m `basename "$1"` \e[m"
            echo "  $1"
            if [ $2 = "fetch" ] ; then
                git -C $1 fetch
            elif [ $2 = "ffmerge" ] ; then
                git -C $1 merge --ff
            fi
            git -C $1 status -sb 
        else
            echo "dir found, .git not exist: $dotgit"
        fi
    else
        #directory sonzai sinai.
        echo "dir not found: $1"
    fi
}

function check_git_status() {
    echo "----------------------------------------------------------"
    while [ $# -gt 0 ] ; do
        check_one_git_status $1 "n"
        echo "----------------------------------------------------------"
        shift
    done
}

function check_git_status_with_fetch() {
    echo "----------------------------------------------------------"
    while [ $# -gt 0 ] ; do
        check_one_git_status $1 "fetch"
        echo "----------------------------------------------------------"
        shift
    done
}

function check_git_status_with_merge() {
    echo "----------------------------------------------------------"
    while [ $# -gt 0 ] ; do
        check_one_git_status $1 "ffmerge"
        echo "----------------------------------------------------------"
        shift
    done
}

function clone_git_projects() {
    echo "----------------------------------------------------------"
    while [ $# -gt 0 ] ; do
        local prdir=`bash -c "echo $1"`
        local supdir=`dirname $prdir`
        if [ -e $prdir ]; then
            echo "$prdir exists"
        elif [ -d "$supdir" ] ; then
            echo -e "\e[37;44;5m `basename $prdir` \e[m"
            echo "Do you want to clone?: git -C $supdir clone $2"
            select answer in yes no exit
            do
                if [ "$answer" = "yes" ]; then
                    git -C $supdir clone $2
                    break
                elif [ "$answer" = "no" ]; then
                    break
                elif [ "$answer" = "exit" ]; then
                    return
                fi
            done
        else 
            echo "$prdir not found"
        fi
        echo "----------------------------------------------------------"
        shift
        shift
    done 
}

