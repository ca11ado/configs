#!/bin/bash

hosts_path=/var/www/nodeStatic/

if [ $# -gt 0 ]; then
  if [ "$1" == "-help" ]; then
    echo 'управление серверами с нодой'
  fi
  if [ "$1" == "-list" ]; then
    echo "$(ps ax | grep node)"
  fi
  if [ "$1" == "inache" ]; then
    #pid="$(ps ax | grep serverNode | sort | head -1 | awk '{ print $1 }')"
    re='^[0-9]+$'
    pid="$(pgrep -f serverNode | awk '{ print $1 }')"
    if [ "$2" == "-start" ]; then
      #if [ -z ${pid+x} ]; then
      #if [ "$#pid" -gt 0 ]; then
      if ! [[ $pid =~ $re ]] ; then
        echo starting node server
        cd $hosts_path/inache
        nohup node ./serverNode.js &
        echo server running
      else
        echo this server already exists
      fi
    fi
    if [ "$2" == "-stop" ]; then
      #if [ -z ${pid+x} ]; then
      if ! [[ $pid =~ $re ]] ; then
        echo this server does not exists
      else
        echo this server exists -- kill him 
        kill $pid
      fi
    fi
    if [ "$2" == "-status" ]; then
      #if [ -z ${pid+x} ]; then
      if ! [[ $pid =~ $re ]] ; then
        echo this server does not exists
      else
        echo this server exists
        echo $pid
      fi
    fi
  fi
  #if [ "$1" == "-update" ]; then
  #  if [ "$2" == "configs" ]; then
  #    update-configs
  #  fi
  #fi
else
    echo "No parameters"
fi
