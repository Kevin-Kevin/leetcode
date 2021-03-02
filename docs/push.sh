echo 'make dictionary ...'
book sm -t 'leetcode 刷题笔记'

path = $(basename)

echo 'gitbook build ...'
cd ../
gitbook build leetcode leetcode/docs

cd leetcode

echo 'git add all ...'
git add --all

echo 'git commit ...'
git commit -a -m "add md file"

echo 'git push ...'
git push
