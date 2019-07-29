$ docker pull centos:5.11

$ docker run -v `pwd`/code/:/var/theHounds/ --name DogHouse -it centos:5.11 /bin/bash

$ cd /var/theHounds/

$ ./SetUpEnv.sh

$ ./ReleaseTheHounds.sh