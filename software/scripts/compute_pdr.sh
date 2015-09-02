#!/bin/bash

#converts a long address (8 bytes) into a short one (2 bytes)
function addr_long_to_short {
#	return ${1:12:4}
	result=${1:12:4}

}


TMPFILE=`mktemp` || exit 1
NODESLIST=`mktemp` || exit 1


grep STAT_DATAGEN $1 | cut -d "|" -f 7 | cut -d "=" -f 2 > $TMPFILE

#get the node list
sort -u $TMPFILE > $NODESLIST
NBNODES=`wc -l $NODESLIST | cut -d " " -f 1` 
echo "$NBNODES nodes (+dagroot)"
#cat $NODESLIST


#get the pdr
for addr_l in `cat $NODESLIST` 
do
	echo "node $addr_long:"
	addr_long_to_short $addr_l
	addr_s=$result
	PKTX=`cat $1 | grep STAT_DATAGEN | grep "addr=$addr_s" | wc -l | cut -d " " -f 1`
	PKRX=`cat $1 | grep STAT_PK_RX | grep "owner=$addr_l" | wc -l | cut -d " " -f 1 `

	PDR=`echo "$PKRX / $PKTX" | bc -l`
	echo "pdr=$PDR ($PKRX / $PKTX)"
 
done



#rm $TMPFILE
#rm $NODESLIST
