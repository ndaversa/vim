export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="blinks"

setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt NO_HIST_BEEP
setopt SHARE_HISTORY

#search backwards and forwards with a pattern
bindkey -M vicmd '/' history-incremental-pattern-search-backward
bindkey -M vicmd '?' history-incremental-pattern-search-forward

# set up for insert mode too
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew git vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# bindkey -v

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:~/node_modules/coffee-script/bin:~/node_modules:/usr/local/lib/node:/usr/local/share/npm/bin:/usr/local/lib/node_modules
export PATH=~/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/opt/local/bin:$PATH
export POLAR=Ninos-iMac.160913734.members.btmm.icloud.com.
alias npmi="npm install -g"
alias chrome='open -a "Google Chrome"'
alias rvm="~/.rvm/bin/rvm"

#tmux colors
alias tmux="TERM=screen-256color-bce tmux"

# new tab from current dir
tab() {
  osascript -e "
  tell application \"iTerm\"
   tell the first terminal
    launch session \"Default Session\"
    tell the last session
     write text \"$(pwd)\"
    end tell
   end tell
  end tell"
}

alias up='cd ..'
alias ph='cd /Users/ndaversa/dev/phoenix-web'
alias me='cd /Users/ndaversa/dev/MediaEverywhere-SDK'
alias ks='cd /Users/ndaversa/dev/MediaEverywhere-KitchenSink'
alias cop='cd /Users/ndaversa/dev/Project-Copper'
alias bs='rake build && rake serve'
alias t='$PWD/tools/commands/commands test'
alias rb='rake build'
alias rs='rake serve'
alias xp='ssh xp@$POLAR'
alias tunnel='ssh -N -p 22 xp@$POLAR -L 3000/localhost/3000'
cop
