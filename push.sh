echo 'make dictionary ...'
book sm -i index

echo 'copy summary.md to index.md ...'
cp SUMMARY.md index.md

echo 'git commit ...'
git commit -a -m "add md file"

echo 'git push ...'
git push
