#!/bin/bash
ls ~/feeds/*
read -p "please select date  :" Date
read -p "please select the site name :" SiteName
cd /home/hisoft/feeds/$Date
Tar_num=`ls /home/hisoft/feeds/$Date/$SiteName*.tgz |wc -l`
if [[ $Tar_num -eq 1 ]];then 

tar xpf $SiteName.tgz $SiteName.xml
New_Xml_size=`ls -al $SiteName.xml |awk '{print $5}'`
echo "uncompress xml size is   $New_Xml_size "
Old_Xml_size=`ls -al /home/hisoft/sourcecode/data/$SiteName/feed/$SiteName.xml|awk '{print $5}'`
echo "feed xml size is $Old_Xml_size"
read -p " check XMl size , yes or no :" Check
if [[  $Check == "yes" ]];then 
cp /home/hisoft/feeds/$Date/$SiteName.tgz  /home/hisoft/feeds2review/

fi
ls -al /home/hisoft/feeds2review/$SiteName.tgz 
else

for((i=1;i<=$Tar_num;i=i+1))
do 
tar xpf $SiteName-$i\of$Tar_num.tgz $SiteName-$i\of$Tar_num.xml
done
echo "uncompress xml size is" 
ls -al /home/hisoft/feeds/$Date/$SiteName*.xml|awk '{print $5" "$9}'
echo "feed xml size is"
ls -al /home/hisoft/sourcecode/data/$SiteName*of*/feed/$SiteName*.xml|awk '{print $5" "$9}'
read -p " check XMl size , yes or no :" Check

if [[ $Check == "yes" ]];then 
cp /home/hisoft/feeds/$Date/$SiteName*.tgz  /home/hisoft/feeds2review/
fi
ls -al /home/hisoft/feeds2review/$SiteName*.tgz
fi
echo "congratulate, The $SiteName.tgz is in $Feedname"
