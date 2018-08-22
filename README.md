# ops_util/run_eaw.sh
Runs a list of Ericsson AXE MML commands on a list of nodes via ops_nui

Usage
======================
run_eaw.sh -n <nodes_list_file> -c <cmd_list_file> -o <output_folder>

where: \
	&nbsp;&nbsp;&nbsp;&nbsp;**nodes_list_file** is a list of nodes on which to run the commands \
	&nbsp;&nbsp;&nbsp;&nbsp;**cmd_list_file** contains a list of commands to run on the nodes \
	&nbsp;&nbsp;&nbsp;&nbsp;**output_folder** is the folder to create the printouts
	
Example: 
	run_eaw.sh -n nodes.txt -c cmds.txt -o ./logs

Installation
========================
1. Move this folder to your Ericsson OSS account using secure copy\
	```sh
	scp -r ops_util username@oss_ip:~/
	```
2. SSH into your OSS account.\
	```sh
	ssh username@oss_ip
	```
2. Change directory to the ops_util folder \
     	```sh
    	cd ~/ops_util
    	```
3. Update the nodes in nodes.txt and the commands in cmds.txt. \
	```sh
	echo "NODENAME" >> nodes.txt 
	echo "RLDEP:ALL;" >> cmd.txt 
	```
4. Run the run_eaw.sh script and wait for it to complete.\
	```sh
   	./run_eaw.sh -n nodes.txt -c cmds.txt -o ./logs
	```
5. Copy generated printout files from the logs folder to your laptop/PC.\
	```sh
	scp -r username@oss_ip:~/ops_util/logs . 
	```
