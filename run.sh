#!/bin/bash

container="binshu/schemio:latest"
docker pull $container
docker run -v `pwd`:/data -e FS_ROOT_PATH=/data -p 4010:4010 -it $container
