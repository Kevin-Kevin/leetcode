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

res=`echo $?`
if [ "$res" != "0" ]
then 
    exit 1
    echo '---->> error : git add failed'
fi

echo 'git commit ...'
gitCommit='git commit -a -m "add md file"'

res=`echo $?`
if [ "$res" != "0" ]
then
    exit 1
    echo '---->> error : git commit failed'

fi

echo 'git push ...'
git push

res=`echo $?`
if [ "$res" != "0" ]
then
    exit 1
     echo '---->> error : git push failed'

fi
