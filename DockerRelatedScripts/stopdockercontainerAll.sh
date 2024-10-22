#!/bin/bash

docker container stop $(docker ps -a -q)
