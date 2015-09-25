#!/bin/bash
cp /home/hisoft/QA/Retailers.csv.tmp /home/shopstyle/releases/current/data/Retailers.csv
cp /home/hisoft/QA/ShippingCountries.csv.tmp /home/shopstyle/releases/current/data/ShippingCountries.csv

~/releases/current/scripts/loaddb retailers
~/releases/current/scripts/loaddb shippingcountries

read -p " incoming directory eg, 1s or 1f :" NS
ls /home/hisoft/feeds/*/
read -p "create site directory :" SiteDir
read -p "please select date ,input date :" date
read -p "Locale :" Locale
mkdir -p /home/shopstyle/support/products/incoming-$NS/$SiteDir
scp -rp /home/hisoft/feeds/$date/$SiteDir.*  /home/shopstyle/support/products/incoming-$NS/$SiteDir/
$HOME/releases/current/scripts/webappRunner -stop store1
sleep 5
$HOME/releases/current/scripts/webappRunner -stop store1
sleep 5
$HOME/releases/current/scripts/webappRunner -stop admin1
sleep 5
$HOME/releases/current/scripts/webappRunner -stop admin1
$HOME/releases/current/scripts/importProducts2 -importerId $NS -slowImport >> $HOME/logs/import.log$NS 2>&1
$HOME/releases/current/scripts/webappRunner -start store1
sleep 5
$HOME/releases/current/scripts/webappRunner -start store1
sleep 5
$HOME/releases/current/scripts/webappRunner -start admin1
sleep 5
$HOME/releases/current/scripts/webappRunner -start admin1
sleep 5

~/releases/current/scripts/indexProducts -locale $Locale
ls /home/shopstyle/support/products/archive-slow
ls /home/shopstyle/support/products/incoming-$NS/
