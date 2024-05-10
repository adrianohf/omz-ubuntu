# Function: Update System
function update_system() {
    echo "Updating Homebrew..."
    brew update
    brew upgrade
    brew upgrade --cask
    brew autoremove -v
    brew cleanup --prune=all -s -v
    if type brew-cask-upgrade > /dev/null 2>&1; then
        brew cu -a -f -v -y --cleanup
    fi
    brew doctor
    echo "Updating macOS..."
    sudo softwareupdate -i -a
}

# -------------------------------------------------------------------
# Function: free
# -------------------------------------------------------------------
function free() {
  vm_stat | awk -v size=$(grep -o 'page size of [0-9]*' | cut -d' ' -f3) '
  /Pages/{printf("%-16s % 16.2f Mi\n", $1, $2*size/1048576)}'
}
# -------------------------------------------------------------------
# Function: ManPager
# -------------------------------------------------------------------
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# -------------------------------------------------------------------
# Function: Git (add, commit and push)
# -------------------------------------------------------------------
function gcommit() {
  git add -A && git commit -m "$1" && git push --set-upstream origin $(git_current_branch) && git status -sb
}

# -------------------------------------------------------------------
# Function: My IP Address
# -------------------------------------------------------------------
function myip() {
    # ifconfig lo0 | grep 'inet 1' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
    ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " "
$4 " " $5 " " $6}'
    ifconfig en7 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en7 (IPv4): " $2 " " $3 " "
$4 " " $5 " " $6}'
}

# -------------------------------------------------------------------
# Function: Plugin Site-Functions (Disabled)
# -------------------------------------------------------------------
filecount() {
    if [ $# -ne 1 ] || [ ! -d "$1" ]; then
        echo "Use: filecount <directory>"
        return 1
    fi
    
    local directory_numbers files_numbers
    
    read directory_numbers _ files_numbers _ < <(find "$1" -type d -printf . -o -type f -printf .)
    
    echo "Directory numbers: $directory_numbers"
    echo "Files numbers: $files_numbers"
}
