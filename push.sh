echo 'make dictionary ...'
book sm 

echo 'gitbook build ...'
cd ../
gitbook leetcode leetcode/docs

cd leetcode

echo 'git add all ...'
git add --all

echo 'git commit ...'
git commit -a -m "add md file"

echo 'git push ...'
git push
