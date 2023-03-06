#!/usr/bin/env bash

REPOSITORY=/home/ec2-user/cicd_project
cd $REPOSITORY

APP_NAME=cicdexx
JAR_NAME=$(ls $REPOSITORY/build/libs/ | grep 'SNAPSHOT.jar' | tail -n 1)
JAR_PATH=$REPOSITORY/build/libs/$JAR_NAME

CURRENT_PID=$(pgrep -f $APP_NAME)

if [ -z $CURRENT_PID ]
then
  echo "> 종료할 것 없 음."
else
  echo "> kill -9 $CURRENT_PID"
  kill -15 $CURRENT_PID
  sleep 5
fi

echo "> $JAR_PATH 배포"
nohup java -jar $JAR_PATH > /dev/null 2> /dev/null < /dev/null &




##!/usr/bin/env bassh
#
#REPOSITORY=/home/ec2-user/cicdproject
#cd $REPOSITORY
#
#APP_NAME=cicdproject
#JAR_NAME=$(ls $REPOSITORY/build/libs/ | grep 'SNAPSHOT.jar' | tail -n 1)
#JAR_PATH=$REPOSITORY/build/libs/$JAR_NAME
#$JAR_NAME=/home/ec2-user/cicdproject/build/libs/cicd-0.0.1-SNAPSHOT.jar
##JAR_PATH=/home/ec2-user/cicdproject/build/libs/cicd-0.0.1-SNAPSHOT.jar
#
#CURRENT_PID=$(pgrep -f $APP_NAME)
#
#if [ -z $CURRENT_PID ]
#then
#  echo "> 종료할것 없음."
#else
#  echo "> kill -9 $CURRENT_PID"
#  kill -15 $CURRENT_PID
#  sleep 5
#fi
#
#echo "> $JAR_PATH 배포"
#nohup java -jar $JAR_PATH  > /dev/null 2> /dev/null < /dev/null &
##nohup java -jar /home/ec2-user/cicdproject/build/libs/cicd-0.0.1-SNAPSHOT.jar > /dev/null 2> /dev/null < /dev/null &
##nohup java -jar $REPOSITORY/build/libs/icd-0.0.1-SNAPSHOT.jar  > /dev/null 2> /dev/null < /dev/null &