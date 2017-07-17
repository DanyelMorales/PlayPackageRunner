OPYFILE_DISABLE=true tar -c --exclude-from=$1/.gitignore -vzf $1/$2.plar --directory $1  ./
