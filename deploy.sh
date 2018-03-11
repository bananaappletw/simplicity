#!/bin/bash
rm -rf bananaappletw.github.io/
jekyll build --destination=bananaappletw.github.io
cd bananaappletw.github.io/
git init
git add .
git commit -m "Update"
git remote add origin git@github.com:bananaappletw/bananaappletw.github.io.git
git push -u origin master -f
