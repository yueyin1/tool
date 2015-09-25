#!/bin/bash
#set -x 
for i in shopstyle-prod-crawl201.sugarops.com shopstyle-prod-crawl202.sugarops.com shopstyle-prod-crawl203.sugarops.com shopstyle-prod-crawl204.sugarops.com shopstyle-prod-crawl205.sugarops.com shopstyle-prod-crawl02-use1.ec2.shopstyle.com shopstyle-prod-crawl04-use1.ec2.shopstyle.com shopstyle-prod-crawl08-use1.ec2.shopstyle.com shopstyle-prod-crawl10-use1.ec2.shopstyle.com shopstyle-prod-crawl12-use1.ec2.shopstyle.com shopstyle-prod-crawl14-use1.ec2.shopstyle.com shopstyle-prod-crawl16-use1.ec2.shopstyle.com

#do ssh $i hostname
do
Find_result=`ssh $i ps -e -o pid -o etime -o stime -o args|grep cra|grep -v grep| awk '{ if (int(substr($2,1,index($2,"-")-1))>1) {print $1,$2,$3,$6;} }'|grep _ `
Hostname=`ssh $i hostname`
if [  "$Find_result" ] ;then
echo -n  $Hostname
echo " $Find_result "

fi 

done
