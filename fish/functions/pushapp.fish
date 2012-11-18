function pushapp
	rsync -zvrci --delete $HOME/$DEV/$APPLICATION/ $WORK:$HOME/$DEV/$APPLICATION/
end;
