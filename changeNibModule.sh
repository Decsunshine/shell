#!/bin/bash
# get all filename in specified path

swift_suffix='swift'
h_suffix='h'

path=$1

recursivecheck(){

# 拿到所有xib和storyboard的文件，然后查找有没有文件引用，有没有其他xib或storyboard引用

files=$(ls $1)
for rawname in $files
do
	fullname=$(basename $rawname)
	filename=$(echo $fullname | cut -d . -f1)
	extension=$(echo $fullname | cut -d . -f2)

	if [ "$extension" == "$swift_suffix" ];then
	    echo $filename".swift"
        #grep -r "customClass=\"$filename\" customModule=\"ABCD\" customModuleProvider=\"target\">" * | cut -d ':' -f1 | uniq | xargs sed -i "" "s/customClass=\"$filename\" customModule=\"ABCD\" customModuleProvider=\"target\">/customClass=\"$filename\" customModule=\"basic\">/g"
    elif [  "$extension" == "$h_suffix" ];then
	    echo $filename".h"
        #grep -r "customClass=\"$filename\" customModule=\"ABCD\" customModuleProvider=\"target\">" * | cut -d ':' -f1 | uniq | xargs sed -i "" "s/customClass=\"$filename\" customModule=\"ABCD\" customModuleProvider=\"target\">/customClass=\"$filename\" customModule=\"basic\">/g"
	fi
        if [  "$extension" == "$filename" ];then
	    echo $filename"_Dir"
	    recursivecheck $1"/"$filename
	fi
done

}

recursivecheck $path;
