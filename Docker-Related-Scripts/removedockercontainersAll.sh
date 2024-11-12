#!/bin/bash

docker container rm $(docker ps -a -q)
