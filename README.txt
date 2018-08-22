Introduction
======================
This utility  takes a list of Ericsson nodes and MML commands and runs them via ops_nui.

Usage
======================
run_eaw.sh -n <nodes_list_file> -c <cmd_list_file> -o <output_folder>

where:
	nodes_list_file is a list of nodes on which to run the commands 
	cmd_list_file contains a list of commands to run on the nodes
	output_folder is the folder to create the printouts
	
Example: 
	run_eaw.sh -n nodes.txt -c cmds.txt -o ./logs

Installation
========================
1. Move this folder to your Ericsson OSS account using secure copy
	scp -r ops_util username@oss_ip:~/
2. SSH into your OSS account.
	ssh username@oss_ip
3. Change directory to the ops_util folder 
    cd ~/ops_util 
4. Update the nodes in nodes.txt and the commands in cmds.txt.
	echo "BSCAFLA" >> nodes.txt 
	echo "RXTCP:MOTY=RXOTG;" >> cmd.txt 
5. Make the run_eaw.sh script executable 
	chmod +x ./run_eaw.sh
6. Run the run_eaw.sh script and wait for it to complete.
   ./run_eaw.sh -n nodes.txt -c cmds.txt -o ./logs
7. Copy generated printout files from the logs folder to your laptop/PC.
	scp -r username@oss_ip:~/ops_util/logs . 
