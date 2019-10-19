#!/bin/bash

OPK_NAME=rott.opk

echo ${OPK_NAME}

# Declare an array of string with type
declare -a StringArray=("rott-huntbgin" "rott-darkwar" "rott-rottcd" "rott-rottsite")
 
# create opk
FLIST="misc/rott.png"

# Iterate the string array using for loop
for val in ${StringArray[@]}; do
	echo "making config for :: ${val}"
   
	# create default.gcw0.desktop
	cat > ${val}.gcw0.desktop <<EOF
[Desktop Entry]
Name=RoTT - ${val}
Comment=Rise of The Triad
Exec=${val}
Terminal=false
Type=Game
StartupNotify=true
Icon=rott
Categories=games;
EOF

	FLIST="${FLIST} ${val}.gcw0.desktop"
	FLIST="${FLIST} ${val}"
done

rm -f ${OPK_NAME}
mksquashfs ${FLIST} ${OPK_NAME} -all-root -no-xattrs -noappend -no-exports

rm -f *.gcw0.desktop
echo "done"
