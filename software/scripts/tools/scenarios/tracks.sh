#!/bin/bash



#options
#RPLMETRIC_LIST="1 3 4"
RPLMETRIC_LIST="1 3 4"
RPLMETRIC="1"
SCHEDALGO=2
TRACK=1
TRACK_LIST="0 1"
DCELLS=1

#topology
NODE_START=210
NODE_STEP=4
SITE=grenoble

#traffic
TRAFFIC_MSEC=1000		#ms between two packets (from ANY node) 


#experiment
DURATION=60					#in minutes
DIRNAME="tracks"

#one experiment for debug
#export DEBUG=1
#nbnodes=15
#RPLMETRIC=4
#iotlab_launch_exp.sh $DCELLS $TRACK $RPLMETRIC $SCHEDALGO $nbnodes $SITE $NODE_START $NODE_STEP $DURATION $TRAFFIC_MSEC test
#exit



#a list of experiments
for nbnodes in {5..30..5}
do
	for TRACK in $TRACK_LIST
	do
		echo "./launch_exp.sh $algo_distrib_cells $TRACK $RPLMETRIC $SCHEDALGO $nbnodes $SITE $NODE_START $NODE_STEP $DURATION $TRAFFIC_MSEC $DIRNAME"
		iotlab_launch_exp.sh $DCELLS $TRACK $RPLMETRIC $SCHEDALGO $nbnodes $SITE $NODE_START $NODE_STEP $DURATION $TRAFFIC_MSEC $DIRNAME
	done
done 


