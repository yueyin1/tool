#!/bin/sh
#set -x
DATE=`date +"%Y%m%d"`
ls /home/hisoft/feedsbackup/
read -p  "please input XML name:" XML
Merge=` ls /home/hisoft/sourcecode/data/$XML*m*/feed/$XML.xml `

 if [ ! -n "$Merge" ]; then

/home/shopstyle/releases/current/scripts/javawrapper -Xmx512m com/shopstyle/importer/ProductFeedDiffer -showFieldDiffs /home/hisoft/feedsbackup/$XML.xml /home/hisoft/sourcecode/data/$XML/feed/$XML.xml > /home/shopstyle/diff-log/diff-$XML-$DATE.log

else

/home/shopstyle/releases/current/scripts/javawrapper -Xmx512m com/shopstyle/importer/ProductFeedDiffer -showFieldDiffs /home/hisoft/feedsbackup/$XML.xml $Merge > /home/shopstyle/diff-log/diff-$XML-$DATE.log

fi

LOG=/home/shopstyle/diff-log/diff-$XML-$DATE.log
Missing_Products=`grep " Missing Products]" $LOG | awk '{print $5}'`
Product_Counts=`grep "[0-9] / [0-9]" $LOG|awk '{print $1}'`
Percentage=`echo "scale=2;$Missing_Products*100/$Product_Counts"|bc`%
sed -i '/Product Counts:/i\Percentage='$Percentage'' $LOG

