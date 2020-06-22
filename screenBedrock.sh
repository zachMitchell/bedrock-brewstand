#!/bin/bash
#this is designed to run from launch.sh, but you can run this separately if you know where the path to your server is.
cd $1;
LD_LIBRARY_PATH=. ./bedrock_server;