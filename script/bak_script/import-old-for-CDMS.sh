#!/bin/bash
read -p "slow import or fast :" Slow


ls /home/hisoft/feeds/*/
read -p "create site directory :" SiteDir
read -p "please select date ,input date :" date
export NS
export SiteDir
export date

if [[ $Slow == "slow" ]] ; then
read -p " incoming directory eg, 1s or 2s :" NS
su shopstyle -c "/home/shopstyle/script/slow-import-old.sh"


else
read -p " incoming directory eg, 1f or 2f :" NF
su  shopstyle -c "/home/shopstyle/script/fast-import-old.sh"

fi
