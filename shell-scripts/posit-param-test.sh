#! /bin/bash

# posit-param: script to view command line parameters

echo "
Number of arguments: $#
\$0 = $0
\$1 = $1
\$2 = $2
\$3 = $3
\$4 = $4
\$5 = $5
\$6 = $6
\$7 = $7
\$8 = $8
\$9 = $9
"

# file_info: simple file information program
PROGNAME=$(basename $0)
if [ -e $1 ]; then
	echo -e "\nFile Type:"
	file $1
	echo -e "\nFile Status:"
	stat $1
else
	echo "$PROGNAME: usage: $PROGNAME file" >&2
	exit 1
fi

echo '
$* 展开成一个从 1 开始的位置参数列表。当它被用双引号引
起来的时候,展开成一个由双引号引起来的字符串,包含了
所有的位置参数,每个位置参数由 shell 变量 IFS 的第一个
字符(默认为一个空格)分隔开。
$@
展开成一个从 1 开始的位置参数列表。当它被用双引号引
起来的时候,它把每一个位置参数展开成一个由双引号引起
来的分开的字符串。
'
# $* $@
echo \$* = $*
echo \"\$*\" = $*
echo \$@ = $@
echo \"\$@\" = $@

# posit-params3 : script to demonstrate $* and $@
function print_params()
{
	echo "\$1 = $1"
	echo "\$2 = $2"
	echo "\$3 = $3"
	echo "\$4 = $4"
}

function pass_params()
{
	echo -e "\n" '$* :'; print_params $*
	echo -e "\n" '"$*" :'; print_params "$*"
	echo -e "\n" '$@ :'; print_params $@
	echo -e "\n" '"$@" :'; print_params "$@"
}

echo -e "\n" 'result of pass_params "word" "words with spaces":'
pass_params "word" "words with spaces"

# posit-param2: script to display all arguments
count=1
while [[ $# -gt 0 ]]; do
	echo "Argument $count = $1"
	count=$((count+1))
	shift
done


