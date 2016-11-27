while getopts bt: option
do
    case "${option}"
    in
        t) TIME=${OPTARG};;
        b) PAUSE=1;;
    esac
done

export tmcom='gtd'

if [ -n "$PAUSE" ]
then
    export tmcom="$tmcom  -b"
fi

if [ -n "$TIME" ]
then
    export tmcom="$tmcom -t $TIME"
fi

tmux new-session "tmux source-file ~/.tmux-session-config"
