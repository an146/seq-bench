do_test ()
{
	echo $1
	eval $1
}

echo processing enum, then converting to list
do_test "time ./seqbench 3000000 0"
echo converting to list, then use List.map on it
do_test "time ./seqbench 3000000 1"
echo written by hand
do_test "time ./seqbench 3000000 2"
