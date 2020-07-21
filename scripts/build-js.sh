#!bin/bash
cd ../frontend/vuejs
npm run build
cd ../..
mv public/dist/* public/
rm -rf public/dist
mv public/index.html public/spa.blade.php
