#! /bin/sh
echo '
字符串展开

1. ${#parameter}
   展开成由 parameter 所包含的字符串的长度。通常,parameter 是一个字符串;然而,如果
parameter 是 @ 或者是 * 的话,则展开结果是位置参数的个数。

2. ${parameter:offset}
   ${parameter:offset:length}
   这些展开用来从 parameter 所包含的字符串中提取一部分字符。提取的字符始于第 offset
个字符(从字符串开头算起)直到字符串的末尾,除非指定提取的长度。

3. ${parameter#pattern}
   ${parameter##pattern}
   这些展开会从 paramter 所包含的字符串中清除开头一部分文本,这些字符要匹配定义的
pattern。pattern 是通配符模式,就如那些用在路径名展开中的模式。这两种形式的差异之处
是该 # 形式清除最短的匹配结果,而该 ## 模式清除最长的匹配结果。

4. ${parameter%pattern}
   ${parameter%%pattern}
   这些展开和上面的 # 和 ## 展开一样,除了它们清除的文本从 parameter 所包含字符串的
末尾开始,而不是开头。

5. ${parameter/pattern/string}
   ${parameter//pattern/string}
   ${parameter/#pattern/string}
   ${parameter/%pattern/string}
   这种形式的展开对 parameter 的内容执行查找和替换操作。如果找到了匹配通配符 pattern
的文本,则用 string 的内容替换它。在正常形式下,只有第一个匹配项会被替换掉。在该 //
形式下,所有的匹配项都会被替换掉。该 /# 要求匹配项出现在字符串的开头,而 /% 要求匹
配项出现在字符串的末尾。/string 可能会省略掉,这样会导致删除匹配的文本。
************************************************************************************
'
str="file.txt.bak"
echo "str=$str"
echo '${#str} = '"${#str}"
echo '${str:2} = '"${str:2}"
echo '${str:2:5} = '"${str:2:5}"
echo '${str#*.} = '"${str#*.}"
echo '${str##*.} = '"${str##*.}"
echo '${str%*.} = '"${str%.*}"
echo '${str%%*.} = '"${str%%.*}"
echo '${str/t/#} = '"${str/t/#}"
echo '${str/t} = '"${str/t}"
echo '${str//t/#} = '"${str//t/#}"
echo '${str/#fi/@} = '"${str/#fi/@}"
echo '${str/%ak/!!} = '"${str/%ak/!!}"
echo '
************************************************************************************
'
