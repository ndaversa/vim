function pullapp
	rsync -zvrci --delete $WORK:$HOME/$DEV/$APP/ $HOME/$DEV/$APP/
end;

