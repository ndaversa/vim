function pullapp
	rsync -zvrci --delete $WORK:$HOME/$DEV/$APPLICATION/ $HOME/$DEV/$APPLICATION/
end;

