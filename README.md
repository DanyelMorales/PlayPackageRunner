# PlayPackageRunner
A deployable package for Play Framework.  Creates a plar package to be deployed and distributed with ease. 

> Note: The Plar output of any play project is found in: "path/to/yourplayproject/***target***/***desiredName***/***desiredName.plar***"



### usage

```
 ./plarx.sh [create|run|erun|extract] -f /path/to/your/playproject -n plarName
```

| Command | Description                            |
| :------ | :------------------------------------- |
| create  | Creates a new plar package             |
| run     | Runs a plar package with no extraction |
| erun    | Extracts & runs a plar package         |
| extract | Only extracts the plar package         |



#### Options for [run|erun|extract]

| Command | Description                              |
| ------- | ---------------------------------------- |
| -f      | Path where the plar package is found     |
| -n      | Package name to be executed or extracted |

#### Options for [create]

| Command | Description                             |
| ------- | --------------------------------------- |
| -f      | Path to the play project to be packaged |
| -n      | Desired package name                    |

#### Config File

| Command     | Description                              |
| ----------- | ---------------------------------------- |
| playcommand | Command used to  execute the play framework over the plar package |