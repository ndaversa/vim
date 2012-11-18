function pushapp
	rsync -zvrci --delete $HOME/$DEV/$APP/ $WORK:$HOME/$DEV/$APP/
end;
