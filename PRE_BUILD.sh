#!/bin/bash

# Change active working directory in case we run script from outside of TheForge
cd "$(dirname "$0")"

filename="Art.zip"
if [ -e "$filename" ]; then
    rm "$filename"
fi

echo "Pulling Art Assets"
wget -O "$filename" "http://www.conffx.com/$filename"

echo "Unzipping Art Assets..."
7z x "$filename" -y > /dev/null

# Copy ZipFiles to the right location as they're big to be committed without lfs
if [ -d "Art/ZipFilesDds" ]; then
	mv "Art/ZipFilesDds" "Examples_3/Unit_Tests/UnitTestResources"
fi
if [ -d "Art/ZipFilesKtx" ]; then
	mv "Art/ZipFilesKtx" "Examples_3/Unit_Tests/UnitTestResources"
fi

echo "Finishing up..."
rm "$filename"

exit 0
