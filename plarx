#!/usr/bin/env bash
#####
#    - Create        create     0
#    - Run 			   run		1
#    - Extract & Run erun	2
#    - Extract Only   extract 3
 #	  Author:  DANIEL VERA MORALES 
#####
currentdirsc="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/plarx.cfg";
if [[ -f $currentdirsc ]]; then
	source $currentdirsc;
else
	playcommand="play";
fi;

ttodo="";


###############################################################
#								 								FUNCTIONS
###############################################################
function getPath(){
	echo $(dirname "$1");
};
function getBaseName(){
	return $(basename "$1");
}
function getFName(){
	filename= getPath $1;
	echo "${filename%.*}";
};
function getExt(){
	echo ".plar";
};
function getWCD(){
		BASEDIR=getPath $1;
		filename=getFName $1;
		project=$BASEDIR"/"$filename;
};

function makeD(){
		path=$1;
		if [[ -f "${path}" ]]; then
				echo "+++";
		else
				mkdir $path;
		fi
};

###############################################################
# 														METHODS
###############################################################
function runPlar(){
	ind=$1;
	name=$2;
	pack=$name$(getExt "");
	path=$3;
	cd $path&&$playcommand dependencies&&$playcommand run;
};

function extractPlar(){
		ind=$1;
		name=$2;
		pack=$name$(getExt "");
		path=$3;
		tar -xvzf $ind"/"$pack --directory $path;
};

function createPlar(){
	path=$1;
	name=$2;
	target=$path"/target";
	pack=$target"/"$name$(getExt "");
	
	if [[ -f !$target ]]; then
		makeD $target;
	fi;
	
	OPYFILE_DISABLE=true tar -c --exclude-from=$path/.gitignore -vzf  $pack  --directory $path  ./
};

###############################################################
# 														OPTS ARGS
###############################################################
function showError(){
		echo -e " \n";
		echo -e $1;
		echo $"Usage: $0 [create|run|erun|extract] -f /path/to/your/playproject -n plarName"
		exit 1
};

function showHeader(){
	echo -e "=======================================";
	echo -e "=====    PLAY PACKAGER & RUNNER";
	echo -e "=====    Daniel Vera Morales";
	echo -e "=======================================";
};
function showDocumentation(){
	showHeader "";
	echo -e "[create]: \n\t-f path to play project to be compressed   \n\t-n desired package name ex: -n deployable";
	echo -e "[run|erun|extract]: \n\t-f path where the plar package is found   \n\t-n package name to be executed ex: -n deployable";
	echo -e "=======================================";
	exit 1;
};
###
# MYPATH  ---> out/in
# MYNAME ---> source pack
###
function showMenu(){
case "$1" in
			"create")
				 ttodo="0";
				;;	
			"run")
				ttodo="1";
				;;	
			"erun") 
				 ttodo="2";
				;;	
			"extract") 
				 ttodo="3";
				;;			
			"help") 
				 showDocumentation "";
				;;	
			*)
			showError "[!] UNKNOWN ARG";
esac
shift;
while [ "$#" -gt 1 ]; do
	case "$1" in
			-f)
				 MYPATH=$2;
				;;	
		    -n)
				 MYNAME=$2;
				;;	
			*)
			  showError "[-] Plz. Provide play directory or package's name";
	esac
	shift;
	shift;
done 
};

###############################################################
# 														MAIN
###############################################################
showMenu $@;
if [[ -n "$ttodo" ]] ;then
	showHeader;
	path=$MYPATH"/"$MYNAME;
	case "$ttodo" in
		"0")
			createPlar  $MYPATH  $MYNAME $path;
		;;
		"1") 
			tmpPath=$(mktemp -d  /tmp/${MYNAME}XXXXXXXXXX) || exit 1;
			extractPlar  $MYPATH  $MYNAME $tmpPath;	 
			runPlar  $MYPATH  $MYNAME  $tmpPath;	 
		;;
		"2")		
			makeD $path;
			extractPlar  $MYPATH  $MYNAME $path;	 
			runPlar  $MYPATH  $MYNAME $path;	 
		;;
		"3")
			makeD $path;
			extractPlar  $MYPATH  $MYNAME $path;	 
		;;
	esac
	else
		showError "[!] Can't continue... unexpected error...";
fi;