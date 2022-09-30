#!/bin/sh

NONE='\033[00m'
RED='\033[01;31m'
GREEN='\033[01;32m'
YELLOW='\033[01;33m'
PURPLE='\033[01;35m'
CYAN='\033[01;36m'
WHITE='\033[01;37m'
BOLD='\033[1m'
UNDERLINE='\033[4m'
BLINK='\x1b[5m'
clear
rm ~/storage/shared/emudeck.log &>> /dev/null
touch ~/storage/shared/emudeck.log &>> /dev/null
echo "### Update: logs reset"  &>> ~/storage/shared/emudeck.log
echo -ne  "Updating Updater..."
cd ~/emudeck/backend/ &>> ~/storage/shared/emudeck.log 
echo "### Update: cd metadata directory "  &>> ~/storage/shared/emudeck.log
git reset --hard &>> ~/storage/shared/emudeck.log 
echo "### Update: git reset "  &>> ~/storage/shared/emudeck.log
git pull &>> ~/storage/shared/emudeck.log 
echo "### Update: git pull "  &>> ~/storage/shared/emudeck.log
cp ~/emudeck/backend/update.sh ~/update.sh
chmod a+rwx ~/update.sh
cp ~/emudeck/backend/run_update.sh ~/run_update.sh
chmod a+rwx ~/run_update.sh
cp ~/emudeck/backend/scrap.sh  ~/scrap.sh
chmod a+rwx ~/scrap.sh
cp ~/emudeck/backend/compress.sh  ~/compress.sh
chmod a+rwx ~/compress.sh
cp ~/emudeck/backend/undo.sh  ~/undo.sh
chmod a+rwx ~/undo.sh
cp ~/emudeck/backend/startup.sh  ~/startup.sh &>> ~/storage/shared/emudeck.log
chmod a+rwx ~/startup.sh &>> ~/storage/shared/emudeck.log
cp ~/emudeck/backend/snes_config.sh  ~/snes_config.sh &>> ~/storage/shared/emudeck.log
chmod a+rwx ~/snes_config.sh &>> ~/storage/shared/emudeck.log
echo "### Update: cp .sh "  &>> ~/storage/shared/emudeck.log

echo -e "${GREEN}OK${NONE}"
/bin/bash ~/run_update.sh
