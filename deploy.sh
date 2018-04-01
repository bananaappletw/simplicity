#!/bin/bash
rm -rf _site
git clone git@github.com:bananaappletw/bananaappletw.github.io.git _site
JEKYLL_ENV=production jekyll build
cd _site
git add .
git commit --allow-empty -m "Update"
git push
