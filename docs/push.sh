echo 'make dictionary ...'
book sm -t 'leetcode 刷题笔记'

pwd=`pwd`
path=`basename $pwd`

echo 'gitbook build ...'
cd ../
gitbook build $path $path/docs

cd leetcode

echo 'git add all ...'
git add --all

echo 'git commit ...'
git commit -a -m "add md file"

echo 'git push ...'
git push
