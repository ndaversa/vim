set fish_greeting ""
set PATH /usr/local/sbin $PATH
set PATH /usr/local/bin $PATH
set PATH /usr/local/opt/ruby/bin $PATH
set PATH /opt/local/bin $PATH
set PATH ~/bin $PATH
set PATH "~/.nvm" $PATH
set -g DEV "dev"
set -g WEB "web"
set -g CHEF "chef-repo"
set -g CAROUSELJS "carousel.js"
set -g DESIGN "design"
set -g MARKETING "marketing"
set -g web "web"
set -g fe "frontend"
set -g hal "hal"
set -g loki "hubot-loki-bot"
set -g jira "hubot-jira-bot"
set -g github "hubot-github-bot"
set -g hope "new-hope-schedule-opt"
set -gx NVM_DIR ~/.nvm

# GOLANG configurations
set -gx GOPATH $HOME/$DEV
set -gx GOROOT /usr/local/opt/go/libexec
set PATH $GOPATH/bin $GOROOT/bin $PATH

hal
