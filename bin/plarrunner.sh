filename=$(basename "$1");
filename="${filename%.*}";
BASEDIR=$(dirname "$1");
project=$BASEDIR"/"$filename;
mkdir $project;
tar -xvzf $1 --directory $project;
cd $project;
play dependencies;
play run;