#! /bin/sh
if ! type "composer" > /dev/null; then
    echo "Install Composer!"
    exit -1
fi
if  ! type "npm" > /dev/null; then
    echo "Install Node.js and npm!"
    exit -2
fi
if ! type "git" > /dev/null; then
    echo "Install git!"
    exit -3
fi
# run Composer
composer install
# run npm
npm install
# remove git repository
rm -rf ./.git*
# init new git repository
git init
