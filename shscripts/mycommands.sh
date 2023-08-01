source $HOME_DOTFILES/shscripts/git_status.sh

function chgit() {
    local repodat="$HOME/.repodat"
    local STR=""
    for line in `cat $repodat`
    do
        echo $line | grep -q '^\s*#' #コメントチェック   #  で始まるときはコメント
        if [ $? = 0 ]; then 
            continue
        fi
        echo $line | grep -q '/\*$'  #配下監視チェック   /* で終わるときは深さ1のディレクトリfindする
        if [ $? = 0 ]; then
            STR=${STR}$(find $(eval echo $line | sed 's/\*$//') -maxdepth 0 -type d | tr "\n" ' ')
        else
            STR="${STR}$(eval echo $line) "
        fi
    done

    if [ $# -eq 0 ] ; then
        echo 'help: -h'
        #=→空白の箇所で単語分割
        check_git_status ${=STR}
    elif [ "$1" = "-h" ] ; then
        echo "chgit"
        echo "chgit fetch"
        echo "chgit ffmerge"
        echo "chgit clone <path: projects.txt>"
        echo "chgit cd <dir>"
        echo "chgit -h"
    elif [ "$1" = "cd" ] ; then
        cd `echo $STR | tr " " "\n" | grep "$2"`
    elif [ "$1" = fetch ] ; then
        check_git_status_with_fetch ${=STR}
    elif [ "$1" = ffmerge ] ; then
        check_git_status_with_merge ${=STR}
    elif [ "$1" = clone ] ; then 
        if [ $# -eq 2 ] ; then 
            if [ -e "$2" ] ; then
                clone_git_projects `cat "$2"`
            fi
        else
            echo "invalid input"
            echo "format: chgit clone <path>"
        fi
    fi 
}

