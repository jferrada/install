#/bin/bash

directory="$1"

for i in $(echo {bin,.chef,.docker,.gnupg,.gSTM,.ssh,install,jd2,git,opt,svn}); do
	rsync -av --delete ~/"$i" "$directory/"
done
for i in $(echo {Ferdium,filezilla,gcloud,google-chrome,KeePass}); do
	rsync -av --delete ~/.config/"$i" "$directory/.config/"
done
rsync -av --delete ~/.local/share/remmina "$directory/.local/share/"
rsync -av --delete ~/.local/bin "$directory/.local/"
