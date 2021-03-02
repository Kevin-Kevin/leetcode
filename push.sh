echo 'make dictionary ...'
book sm -i index -t 'leetcode 刷题笔记'

echo 'copy summary.md to index.md ...'
cp SUMMARY.md index.md

echo 'git commit ...'
git commit -a -m "add md file"

echo 'git push ...'
git push
