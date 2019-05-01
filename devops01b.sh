#!/bin/bash

source devops01a.sh dummy

usage()
{
cat << EOF
usage: $0 options

In order to run this script you need to pass one of below options

OPTIONS:
   -h            Show this message
   -network      Network information about this machien 
   -ram      	 Installed memory on this machine (in Gb)
   -cpu      	 CPU information of this machine 
   -volumes      Hard disk information of this machine 
EOF
}

if [[ $# -eq 0 ]] ; then
    echo 'No parameters were passed'
    usage
    exit 0
fi

#Do case insesntive search 
shopt -s nocasematch

for OPTIONS in "$@"
do

case "$OPTIONS" in

 "-network") 
 			 net=1;;
 "-volumes") 
			 vol=1;;
 "-cpu") 
			 cpu=1;;
 "-all") 
			 all=1;;
 "-ram") 
			 mem=1;;

 "-n") 
 			 net=1;;
 "-v") 
			 vol=1;;
 "-c") 
			 cpu=1;;
 "-a") 
			 all=1;;
 "-r") 			 
			 mem=1;;
 "-h")
			usage
			exit 0;;
 *) usage;;
esac

done



if [ ! -z $all ];
	then
 	source devops01a.sh all
 else
 	  if [ ! -z $net ];
 	    then
		getNetWorkInfo
 	  fi

 	  if [ ! -z $vol ]
 	    then
 	   	getDiskInfo;
 	  fi

 	  if [ ! -z $cpu ]
 	    then
 	   	getCPUInfo
 	  fi

 	  if [ ! -z $mem ]
 		then
 	   	getRamInfo
 	  fi
fi






