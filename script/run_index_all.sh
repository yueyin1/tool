#!/bin/bash
nohup ~/releases/current/scripts/indexProducts -locale  en_CA > $HOME/logs/indexProducts_ca.log  2>&1 &
nohup ~/releases/current/scripts/indexProducts -locale  ja_JP > $HOME/logs/indexProducts_jp.log  2>&1 &
nohup ~/releases/current/scripts/indexProducts -locale  en_US > $HOME/logs/indexProducts_us.log  2>&1 &
nohup ~/releases/current/scripts/indexProducts -locale  en_AU > $HOME/logs/indexProducts_au.log  2>&1 &
nohup ~/releases/current/scripts/indexProducts -locale  en_GB  > $HOME/logs/indexProducts_gb.log  2>&1 &
nohup ~/releases/current/scripts/indexProducts -locale  de_DE  > $HOME/logs/indexProducts_de.log  2>&1 &
nohup ~/releases/current/scripts/indexProducts -locale  fr_FR > $HOME/logs/indexProducts_fr.log  2>&1 &


