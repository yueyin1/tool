#!/bin/bash
cp /home/hisoft/QA/Retailers.csv.tmp /home/shopstyle/releases/current/data/Retailers.csv
cp /home/hisoft/QA/Brands.csv.tmp /home/shopstyle/releases/current/data/Brands.csv
cp /home/hisoft/QA/ShippingCountries.csv.tmp /home/shopstyle/releases/current/data/ShippingCountries.csv


~/releases/current/scripts/loaddb brands
~/releases/current/scripts/loaddb retailers
~/releases/current/scripts/loaddb shippingcountries

mkdir -p /home/shopstyle/support/products/incoming-$NS/$SiteDir
scp -rp /home/hisoft/feeds/$date/$SiteDir.*  /home/shopstyle/support/products/incoming-$NS/$SiteDir/
$HOME/releases/current/scripts/webappRunner -stop store1
sleep 5
$HOME/releases/current/scripts/webappRunner -stop store1
sleep 5
$HOME/releases/current/scripts/webappRunner -stop admin1
sleep 5
$HOME/releases/current/scripts/webappRunner -stop admin1
echo "start importing..............pealse wait "
$HOME/releases/current/scripts/importProducts2 -importerId $NS -slowImport > $HOME/logs/import-$SiteDir.log 2>&1
cat $HOME/logs/import-$SiteDir.log >> $HOME/logs/import.log$NS
echo " import done"
$HOME/releases/current/scripts/webappRunner -start store1
sleep 5
$HOME/releases/current/scripts/webappRunner -start store1
sleep 5
$HOME/releases/current/scripts/webappRunner -start admin1
sleep 5
$HOME/releases/current/scripts/webappRunner -start admin1
sleep 5
~/releases/current/scripts/indexProducts -locale $Locale > $HOME/logs/indexProducts-$SiteDir.log 2>&1
cat $HOME/logs/indexProducts-$SiteDir.log >>  $HOME/logs/indexProducts.log

echo " ERROR in import log : "
grep ERROR $HOME/logs/import-$SiteDir.log 
echo " ERROR in indexProducts log :"
grep ERROR $HOME/logs/indexProducts-$SiteDir.log
