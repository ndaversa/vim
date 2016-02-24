set fish_greeting ""
set PATH /usr/local/sbin $PATH
set PATH /usr/local/bin $PATH
set PATH /usr/local/opt/ruby/bin $PATH
set PATH /opt/local/bin $PATH
set PATH ~/bin $PATH
set PATH "/Applications/Android Studio.app/sdk/platform-tools" $PATH
set PATH "/Applications/Android Studio.app/sdk/tools" $PATH
set PATH "~/.nvm" $PATH
set DEV "dev"
set WEB "web"
set CHEF "chef-repo"
set CAROUSELJS "carousel.js"
set DESIGN "design"
set MARKETING "marketing"
set web "web"
set fe "frontend"
set hal "hal"
set jira "hubot-jira-bot"
set github "hubot-github-bot"
set hope "new-hope-schedule-opt"
hal
boot2docker shellinit | source
set -x NVM_DIR ~/.nvm
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
