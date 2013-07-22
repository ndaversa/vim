function pullap
	rsync -zvrci --delete $WORK:$HOME/$DEV/$ap/ $HOME/$DEV/$ap/
end;

