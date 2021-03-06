#!/usr/bin/env bash

xcodebuild

if [ $? -ne 0 ]
	then
		echo "There was an error building; please check the build output, resolve any problems, and try again"
fi


echo $PATH | awk -F : '{for (i=1;i<=NF;i++) {print $i}}' | grep $HOME/bin > /dev/null

if [ $? -ne 0 ]
	then
		echo "Please add $HOME/bin to your \$PATH and create it if it doesn't exist"
		exit 1
fi

if [ ! -f build/Release/appledoc ]
	then
		echo "File ./build/Release/appledoc doesn't exist. This is unusual, do you have a special built products output dir?"
		exit 2 
fi

if [ ! -d ~/.appledoc ]
	then
		mkdir ~/.appledoc
fi

cp build/Release/appledoc $HOME/bin/appledoc
cp -R Templates/* ~/.appledoc
