#! /bin/bash
# demonstrate case conversion
if [[ $1 ]]; then
	echo '${1,,} -> '${1,,}
	echo '${1,} -> '${1,}
	echo '${1^^} -> '${1^^}
	echo '${1^} -> '${1^}
fi

# $((expression))
echo '$((23)) = '$((23))
echo '$((023)) = '$((023))
echo '$((0x23)) = '$((0x23))
echo '$((2#10100101)) = '$((2#10100101))

# arithmetic operation: / %
for ((i=0;i<=20;++i)); do
	rem=$((i%5))
	if (( rem == 0 )); then
		printf "<%d> " $i
	else
		printf "%d " $i
	fi
done
printf "\n"

# arith-loop: script to demonstrate arithmetic operators
finished=0
a=0
printf "a\ta**2\ta**3\n"
printf "=\t====\t====\n"
until ((finished)); do
	b=$((a**2))
	c=$((a**3))
	printf "%d\t%d\t%d\n" $a $b $c
	((a<10?++a:(finished=1)))
done
