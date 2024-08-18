#!/usr/bin/env bash
# stop.sh

PROJECT="study-1.0.0"
PROJECT_NAME=study
PROJECT_FULL_PATH="/home/ec2-user/app2/step2"
JAR_FILE="$PROJECT_FULL_PATH/$PROJECT.jar"
LOG_PATH="$PROJECT_FULL_PATH/logs"

DEPLOY_LOG="$LOG_PATH/0_deploy.log"

NOW_DATETIME=$(date "+%Y-%m-%d-%aT%T")

if [ ! -d $LOG_PATH ]; then
    mkdir $LOG_PATH
fi

CURRENT_PID=$(pgrep -f $JAR_FILE)



if [ -z "$CURRENT_PID" ]; then
  echo "$NOW_DATETIME :: $JAR_FILE :: There is no process!" >> $DEPLOY_LOG
else
  echo "$NOW_DATETIME :: $JAR_FILE :: $CURRENT_PID stopped!" >> $DEPLOY_LOG  
  sudo kill -15 $CURRENT_PID
  sleep 5
fi