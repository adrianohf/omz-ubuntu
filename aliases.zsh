# -------------------------------------------------------------------
# Aliases: docker context
# -------------------------------------------------------------------
alias set-docker-context-managed-cluster-sp="unset DOCKER_HOST; docker context use managed-cluster-sp"
alias set-docker-context-managed-cluster="unset DOCKER_HOST; docker context use managed-cluster"
alias set-docker-context-default="unset DOCKER_HOST; docker context use default"

# -------------------------------------------------------------------
# Aliases: brew
# -------------------------------------------------------------------
alias bs-start="brew services start"
alias bs-stop="brew services stop"
alias bs="brew services"
alias bsl="brew services list"

# -------------------------------------------------------------------
# Aliases: brew (Manual)
# -------------------------------------------------------------------
# Alias	                  Command	                                        Description
# bcubc           brew upgrade --cask && brew cleanup             Update outdated casks, then run cleanup.
# bcubo           brew update && brew outdated --cask             Update Homebrew data, then list outdated casks.
# bfu	            brew upgrade --formula                          Upgrade only formulas (not casks).
# brewp           brew pin                                        Pin a specified formula so that it's not upgraded.
# brews           brew list -1                                    List installed formulae or the installed files for a given formula.
# brewsp          brew list --pinned                              List pinned formulae, or show the version of a given formula.
# bubc            brew upgrade && brew cleanup                    Upgrade outdated formulae and casks, then run cleanup.
# bubo            brew update && brew outdated                    Update Homebrew data, then list outdated formulae and casks.
# bubu            bubo && bubc                                    Do the last two operations above.
# bugbc           brew upgrade --greedy && brew cleanup           Upgrade outdated formulae and casks (greedy), then run cleanup.
# buz	            brew uninstall --zap                            Remove all files associated with a cask.

# -------------------------------------------------------------------
# Aliases: git
# -------------------------------------------------------------------
alias ga='git add'
alias gb='git branch'
alias gc='git checkout'
alias gcd='git checkout dev'
alias gcl='git clone'
alias gd='git diff'
alias gf='git reflog'
alias gl='git log'
alias gm='git commit -m'
alias gma='git commit -am'
alias gpull='git pull'
alias gpush='git push'
alias gra='git remote add'
alias grr='git remote rm'
alias gs='git status'
alias gta='git tag -a -m'

# -------------------------------------------------------------------
# Aliases: Filecounts
# -------------------------------------------------------------------
# alias filecount="ls -aRF | wc -l"
# alias filecount="-type f | wc -l"
alias wordy="wc -w * | sort | tail -n10"

# -------------------------------------------------------------------
# Aliases: My Aliases
# -------------------------------------------------------------------
alias bi="brew install"
alias cat="bat"
alias dcompose="docker compose"
alias df="duf"
alias di="docker images"
alias dircolors="gdircolors"
alias dp="docker pull --platform linux/x86_64"
alias dps="docker ps -a"
alias drun="docker run -it --platform linux/x86_64"
alias dv="docker volume ls"
# alias en0="ifconfig en0"
alias finder="ofd"
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder; echo -n Flushed!"
alias gp="git pull"
alias htop="btop"
# alias ifconfig='echo -n "WIFI ==> "; ifconfig en0 |grep "inet "; echo -n "CABO ==> "; ifconfig en5 |grep "inet "; echo -n "NordVPN ==> "; ifconfig utun4 |grep "inet "'
alias kevents="kubectl events"
alias kget-all="k get-all" #https://github.com/corneliusweig/ketall
alias klogs="kubectl logs"
alias knodes="kubectl get nodes"
alias kns="kubens"
alias konfig="kubectl konfig" #https://github.com/corneliusweig/konfig/blob/master/doc/USAGE.md
alias kpods="kubectl get pods"
alias krew="kubectl krew"
alias ksecrets="ksecrets"
alias kubefix='chmod go-r ~/.kube/config'
alias l="lsd -l"
alias la="lsd -a"
alias ll="lsd -l"
alias ls="lsd"
alias lt="l -SA --total-size"
alias mountdocknvme="diskutil mount DockNVMe"
alias mountsdxc="diskutil mount SDXC256GB"
alias ns="kubectl get ns"
alias omr="omz reload"
alias purge="sudo purge"
alias python="/usr/bin/python3"
alias python="python3"
alias rm="rm -i"
alias size="du -h -d 1 | sort -h | head -n 10" #A opção -d 1 (ou --max-depth=1) limita a saída aos diretórios no nível atual, sem entrar nos subdiretórios1. Se você quiser ver os 10 diretórios que ocupam mais espaço, você pode adicionar o comando head para limitar a saída:
alias speedtest="speedtest -p -A -v"
alias spoofmymac="sudo spoof-mac randomize en0"
alias tf="terraform"
alias top="bashtop"
alias unmountdocknvme="diskutil unmount DockNVMe"
alias unmountsdxc="diskutil unmount SDXC512GB"
alias upd="brew update; brew upgrade --cask; brew upgrade; brew autoremove -v;  brew cu -a -f -v -y --cleanup; brew cleanup --prune all -s -v; sudo softwareupdate -i -a; omz update; omz reload"
alias zshconfig="code ~/.zshrc"
alias vim="nvim"
alias ifconfig.me='curl -s ifconfig.me | awk "{print $1}"'
alias meuip='curl -s ifconfig.me | awk "{print $1}"'
alias aria2c="aria2c -c -x 16 -s 16"

unalias gk

# -------------------------------------------------------------------
# Aliases: Disabled
# -------------------------------------------------------------------
# alias free="free -mhw"
# alias fuckoff="rm -Rf"
# alias fuckyou="sudo rm -Rf"
# alias ifconfig="ifconfig en0 |grep 'inet 1' |awk '{ print $2 }'"
# alias ifconfig="ifconfig en0 |grep inet && ifconfig en12 |grep inet"
# alias see="catimg"

# -------------------------------------------------------------------
# Aliases: YT-DLP (https://github.com/yt-dlp/yt-dlp)
# -------------------------------------------------------------------

# Download best video that is mp4 format and merge with best m4a audio format:
alias yt-dlp-mp4='yt-dlp -o "%(title)s.%(ext)s" -S ext:mp4:m4a'

# Get the best audio into mp3 file:
alias yt-dlp-mp3='yt-dlp -f "ba" -x --audio-format mp3 -o "%(title)s.%(ext)s" -S mp3'

# Playlists
# Example: yt-dlp -f 'bv*[height=1080]+ba' --download-archive videos.txt  https://www.youtube.com/playlist?list=PLlVlyGVtvuVnUjA4d6gHKCSrLAAm2n1e6 -o '%(channel_id)s/%(playlist_id)s/%(id)s.%(ext)s'
alias yt-dlp-playlist='yt-dlp -f "bv+ba" --download-archive videos.txt -o "%(channel_id)s/%(playlist_id)s/%(id)s.%(ext)s"'

# Channels
# Example: yt-dlp -f 'bv*[height=720]+ba' --download-archive videos.txt https://www.youtube.com/c/FootheFlowerhorn/videos -o '%(channel)s/%(title)s.%(ext)s'
alias yt-dlp-channel='yt-dlp -f "bv+ba" --download-archive videos.txt -o "%(channel)s/%(title)s.%(ext)s"'
