please () {
    _please_detect_os
    case $1 in
        "install")
            _please_install "${@:2}"
            ;;
        "search")
            _please_search "${@:2}"
            ;;
        "remove")
            _please_remove "${@:2}"
            ;;
        "update")
            _please_update "${@:2}"
            ;;
        *)
            echo "Error: Unrecognized command $1"
            _please_usage
            ;;
    esac


}
_please_install () {
    case $please_os in
        "arch")
            sudo pacman -S "$@"
            ;;
        "ubuntu")
            sudo apt-get install "$@"
            ;;
        "fedora")
            sudo dnf install "$@"
            ;;
        *)
            echo "Error: Unrecognized os for installing: $please_os"
            ;;
    esac
}
_please_search () {
    case $please_os in
        "arch")
            pacman -Ss "$@"
            ;;
        "ubuntu")
            apt search "$@"
            ;;
        "fedora")
            dnf search "$@"
            ;;
        *)
            echo "Error: Unrecognized os for searching: $please_os"
            ;;
    esac
}
_please_remove () {
    case $please_os in
        "arch")
            sudo pacman -Rs "$@"
            ;;
        "ubuntu")
            sudo apt-get remove "$@"
            ;;
        "fedora")
            sudo dnf remove "$@"
            ;;
        *)
            echo "Error: Unrecognized os for removing: $please_os"
            ;;
    esac
}
_please_update () {
    case $please_os in
        "arch")
            sudo pacman -Syu "$@"
            ;;
        "ubuntu")
            sudo apt-get update && apt-get upgrade
            ;;
        "fedora")
            sudo dnf upgrade "$@"
            ;;
        *)
            echo "Error: Unrecognized os for updating: $please_os"
            ;;
    esac
}
_please_detect_os () {
    source /etc/os-release
    please_os=$ID
}
_please_usage () {
    echo "Usage: please <install|search|update|remove> [package1 package2...]"
}
