#! /bin/bash
# test 和 [ ] 是等价的
# [[ ]] 和 test/[ ] 类似，不同：支持=~匹配正则表达式、==操作符支持类型匹配（参考路径名展开）
# 注意：与或非在[[ ]] 和 test/[ ]中表达有所不同，[[ ]]中：&&、||、！，test/[ ]中：-a、-o、！
# 注意：符号两边要有空格，如[、]、[[、]]、=、==的两侧


if test "kl" = "kl";then echo yes1;else echo no1;fi
if test "kl" = "kl2";then echo yes2;else echo no2;fi
if [ "kl" == "kl" ];then echo yes3;else echo no3;fi
if [ "kl" == "kl2" ];then echo yes4;else echo no4;fi

if [[ "kl" = "kl" ]];then echo yes5;else echo no5;fi
if [[ "kl" = "kl2" ]];then echo yes6;else echo no6;fi

tmp="hcdh"
tmp2=hcdh
if [[ "$tmp" == "hcdh" ]]; then echo yes7;else echo no7;fi
if [[ "$tmp2" == "hcdh" ]]; then echo yes8;else echo no8;fi

INT=hcdh
if [[ "$INT" =~ ^h.{}h$ ]]; then echo yes9;else echo no9;fi
if [[ ^h.{}h$ =~ "$INT" ]]; then echo yes10;else echo no10;fi
if [[ "foo.bar" =~ foo.* ]]; then echo yes11;else echo no11;fi

# (( ))被用来执行算术真测试。如果算术计算的结果是非零值，则其测试值为真。注意它只处理整数。
INT2=-5
if [ $INT2 -lt 0 ]; then echo yes12;else echo no12;fi
if (( $INT2 < 0 )); then echo yes13;else echo no13;fi
if [ INT2 -lt 0 ]; then echo yes14;else echo no14;fi # wrong expression
if [[ INT2 -lt 0 ]]; then echo yes15;else echo no15;fi
if (( INT2 < 0 )); then echo yes16;else echo no16;fi

# command1 && command2 和 command1 || command2
# bash 支持两种可以执行分支任务的控制操作符。&&(AND)和 ||(OR)操作符作用如同复合命
# 令 [[ ]] 中的逻辑操作符。对于 && 操作符,先执行 command1,如果并且只有如果 command1
# 执行成功后,才会执行 command2。对于 || 操作符,先执行 command1,如果并且只有如果
# command1 执行失败后,才会执行 command2。
#mkdir temp && cd temp
#[ -d temp ] && mkdir temp


