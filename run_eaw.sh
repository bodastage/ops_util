#!/bin/sh

# Runs provided AXE commands on provided nodes
#

usage() {
	echo `basename $0`: ERROR: $* 1>&2
	echo usage: `basename $0` '-n node_list_file -c cmd_list_file -o output_directory ' 1>&2
	exit 1
}

file_dir=`dirname $(realpath $0)`
node_list="nodes.txt"
cmd_list="cmd.txt"
scripts_dir="$file_dir/scripts"
output_dir="logs"

# Make sure scripts directory exists 
[ -d $scripts_dir ] || mkdir -p $script_dir

while :
do
    case "$1" in
	-n) shift; node_list="$1";;
	-c) shift; cmd_list="$1";;
	-o) shift; output_dir="$1";;
	--) shift; break;;
	-*) usage "bad argument $1";;
	*) break;;
    esac
    shift
done

for node in `cat $node_list`
do
	for cmd_expr in `cat $cmd_list`
	do
		cmd=`echo $cmd_expr | cut -d":" -f1`
		file_name="${node}.${cmd}"
		
		echo "@CONNECT(\"$node\")" > $scripts_dir/$file_name
		echo "$cmd_expr" >> $scripts_dir/$file_name
		echo "@DISCONNECT" >> $scripts_dir/$file_name
		
	done

done

# Run ops scripts
for script_file in `ls -1 $script_dir`
do
	ops_nui -file "${script_file}" > $output_dir/${script_file}
done 