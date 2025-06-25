#!/bin/bash

if [ ! -f './dist/' ]; then
    mkdir -p ./dist/
fi 
if [ ! -f './temp/' ]; then
    mkdir -p ./temp/
fi 
rm -fr /dist/*


if [ -f './node_modules/' ]; then 
    echo "node_modules folder missing"
    exit;
fi

echo "Copying files to temp folder"
cp ./node_modules/video.js/dist/video.min.js ./temp/
cp ./node_modules/videojs-contrib-ads/dist/videojs.ads.min.js ./temp/
cp ./node_modules/videojs-ima/dist/videojs.ima.js ./temp/
cp ./lib/videojs-analytics.js ./temp/
cp ./lib/videojs-resolution-switcher.js ./temp/


cp ./node_modules/video.js/dist/video-js.min.css ./temp/
cp ./node_modules/videojs-contrib-ads/dist/videojs-contrib-ads.css ./temp/
cp ./node_modules/videojs-ima/dist/videojs.ima.css ./temp/
cp ./lib/videojs-resolution-switcher.css ./temp/

echo "Files copied to temp folder"
{
    cat ./temp/video.min.js
    cat ./temp/videojs.ads.min.js
    cat ./temp/videojs.ima.js
    cat ./temp/videojs-resolution-switcher.js
    cat ./temp/videojs-analytics.js
    
} > ./dist/video.min.js


{
    cat ./temp/video-js.min.css
    cat ./temp/videojs-contrib-ads.css
    cat ./temp/videojs.ima.css
    cat ./temp/videojs-resolution-switcher.css
} > ./dist/video-js.min.css
echo "Files merged to dist folder"

cp fayaah-icon.svg ./dist/fayaah-icon.svg

echo "Copy launch.js to dist folder"

scp ./dist/* root@ad.adsight.nl:/var/www/html/fayaah/
echo "Files copied to server"
