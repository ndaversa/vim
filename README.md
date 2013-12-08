##Install Homebrew
```
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"
```

##Install Fish Shell
```
git clone https://github.com/fish-shell/fish-shell.git
autoconf
./configure --without-xsel
make
sudo make install
```

##Allow Fish as a type of shell
```
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
```

##Run configure
```
bin/configure
```

##iTerm 2
```
http://code.google.com/p/iterm2/downloads/list
```
You will find iterm related goodness in the ```iterm``` directory.
I use Inconsolata 18pt and the Solarized Dark iTerm color profile (also provided)
