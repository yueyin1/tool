#!/bin/bash
$HOME/releases/current/scripts/webappRunner -stop store1
sleep 2
$HOME/releases/current/scripts/webappRunner -stop store1

 $HOME/releases/current/scripts/webappRunner -stop admin1
sleep 2
 $HOME/releases/current/scripts/webappRunner -stop admin1

$HOME/releases/current/scripts/webappRunner -start store1
sleep 2
$HOME/releases/current/scripts/webappRunner -start store1
$HOME/releases/current/scripts/webappRunner -start admin1
sleep 2
