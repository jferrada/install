#/bin/bash

directory="$1"

for i in $(echo {bin,.gnupg,.ssh,install}); do
	rsync -av --delete ~/"$i" "$directory/"
done

for i in $(echo {Ferdium,google-chrome}); do
	rsync -av --delete ~/.config/"$i" "$directory/.config/"
done
