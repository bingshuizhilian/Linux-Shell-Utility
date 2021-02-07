#! /bin/bash

echo '
for: 传统 shell 格式

for variable [in words]; do
commands
done
'
for i in A B C D "$@"; do
	echo $i
done

echo 'omit 'words', then i reffers to posit-param($1...$x)'
for i; do
	echo $i
done

echo '
最新版本的 bash 已经添加了第二种格式的 for 命令语法,该语法相似于 C 语言中的 for 语法
格式。其它许多编程语言也支持这种格式:

for (( expression1; expression2; expression3 )); do
commands
done
'
for((i=-1; i<=5; ++i)); do # i=i+1; i+=1; ++i; i++
	echo $i
done

