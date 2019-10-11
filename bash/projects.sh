LOC=~/.project_data
function projects () {
    if [ -z $1 ]; then
        projects recent
    elif [ $1 = "rm" ]; then
        w=$(cat ~/.project_data | jq "del(.[\"$2\"])")
        echo $w > $LOC
    elif [ $1 = "set" ]; then
        x=$PWD
        if [ -n "$3" ]; then
            x=$3
        fi
        echo $(cat $LOC | jq ". += {\"$2\": \"$x\"}") > $LOC
    elif [ $1 = "ls" ]; then
        cat $LOC | jq -C | head -n -1 | tail -n +2 | sed s/\"//g | sed s/,//
    else
        pushd $PWD > /dev/null
        x=$(cat $LOC | jq -r ".[\"$1\"]")
        projects set recent $x
        cd $x
    fi
}
