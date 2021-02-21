#!/bin/bash

### Inicia o Anaconda e disponibiliza o jupter Notebook
dir="$(pwd)/notebooks" 

### Check for dir, if not found create it using the mkdir ##
[ ! -d "$dir" ] && mkdir -p "$dir"

docker run --name python-dev -i -t -p 8888:8888 -v "$dir:/home" -w "/home" continuumio/anaconda3 /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && pip install django && mkdir /opt/notebooks && /opt/conda/bin/jupyter notebook --allow-root --notebook-dir=/home --ip='*' --port=8888 --no-browser"
docker rm $(docker ps -aq)
