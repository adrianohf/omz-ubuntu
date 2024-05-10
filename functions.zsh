# -------------------------------------------------------------------
# Function: free
# -------------------------------------------------------------------
# Function: Update System
function update_system() {
    echo "Atualizando Homebrew..."
    brew update
    brew upgrade
    brew upgrade --cask
    brew autoremove -v
    brew cleanup --prune=all -s -v
    if type brew-cask-upgrade > /dev/null 2>&1; then
        brew cu -a -f -v -y --cleanup
    fi
    brew doctor
    # brew cleanup -s
    # brew missing
    # brew list
    # brew services list
    # brew cask list
    # brew cask outdated
    # brew cask outdated --greedy
    # brew cask upgrade --greedy
    # brew cask cleanup -s
    # brew cask doctor
    # brew cask cleanup -s
    # brew cask missing
    echo "Atualizando macOS..."
    sudo softwareupdate -i -a
}


function free() {
  vm_stat | perl -ne '/page size of (\d+)/ and $size=$1; /Pages\s+([^:]+)[^\d]+(\d+)/ and printf("%-16s % 16.2f Mi\n", "$1:", $2 * $size / 1048576);'
}
# -------------------------------------------------------------------
# Function: ManPager
# -------------------------------------------------------------------
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# -------------------------------------------------------------------
# Function: Git (add, commit and push)
# -------------------------------------------------------------------
function gcommit() {
  #git add -A; git commit -m "$1"; git push; git status
  gaa; gcmsg "$1"; gpv
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
    if [ $# -ne 1 ]; then
        echo "Uso: filecount <diretório>"
        return 1
    fi
    
    local diretorio="$1"
    
    if [ ! -d "$diretorio" ]; then
        echo "O diretório especificado não existe"
        return 1
    fi
    
    local numero_diretorios=$(find "$diretorio" -type d | wc -l)
    local numero_arquivos=$(find "$diretorio" -type f | wc -l)
    
    echo "Número de diretórios: $numero_diretorios"
    echo "Número de arquivos: $numero_arquivos"
}
