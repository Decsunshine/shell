#!/bin/bash
# get all filename in specified path

swift_suffix='swift'
h_suffix='h'
path=$1
dir_suffix=' '
files=$(ls $path)
for rawname in $files
do
        fullname=$(basename $rawname)
	filename=$(echo $fullname | cut -d . -f1)
	extension=$(echo $fullname | cut -d . -f2)

	if [ "$extension" == "$swift_suffix" ];then
	   echo "*"
           #grep -r "customClass=\"$filename\" customModule=\"ABCD\" customModuleProvider=\"target\">" * | cut -d ':' -f1 | uniq | xargs sed -i "" "s/customClass=\"$filename\" customModule=\"ABCD\" customModuleProvider=\"target\">/customClass=\"$filename\" customModule=\"basic\">/g"
        elif [  "$extension" == "$h_suffix" ];then
           #grep -r "customClass=\"$filename\" customModule=\"ABCD\" customModuleProvider=\"target\">" * | cut -d ':' -f1 | uniq | xargs sed -i "" "s/customClass=\"$filename\" customModule=\"ABCD\" customModuleProvider=\"target\">/customClass=\"$filename\" customModule=\"basic\">/g"
	   echo "^"
	fi

        if [  "$extension" == "$filename" ];then
	   echo "$filename"
	fi
done
