#!/bin/bash

branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

if [[ "$branch" == "master" ]]; then
  target_branch="gh-pages"
else
  suffix="-build"
  target_branch+=$suffix
fi

msg="checking out upstream "
echo $msg$target_branch

echo 'building static site with gitbook'

# install the plugins and build the static site
gitbook install && gitbook build

msg='checking out upstream '
echo $msg$target_branch

# checkout to the gh-pages branch
git branch $target_branch
git checkout $target_branch

echo 'copying static files to project root'

# copy the static site files into the current directory.
rsync -a _book/ .

msg='commiting changes and pushing to '
echo $msg$target_branch

# add all files
git add -A
git add -f gitbook
git add -f *.html

# commit
git commit -a -m "Update docs"

# push to the origin
git push origin $target_branch

msg='returning to git master branch'
echo $msg$target_branch

# checkout to the master branch
git checkout master
