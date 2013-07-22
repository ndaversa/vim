function pushap
	rsync -zvrci --delete $HOME/$DEV/$ap/ $WORK:$HOME/$DEV/$ap/
end;
