#!/bin/bash
hasRedDream=false
hasYaba=false
hasMupen=false
hasPPSSPP=false
hasDuckstation=false
hasDrastic=false
hasDolphinMMJ=false
hasRetroArch=false
hasCitra=false
hasAether=false
hasSkyline=false

#Retroarch?
FOLDER=$(test -d ~/storage/shared/RetroArch && echo -n "true")
case $FOLDER in
  *"true"*)
	hasRetroArch=true
	;;
esac

#Aether?
FOLDER=$(test -d ~/storage/shared/Android/data/xyz.aethersx2.android && echo "true")
case $FOLDER in
  *"true"*)
	hasAether=true
esac
#Citra?
FOLDER=$(test -d ~/storage/shared/citra-emu && echo "true")
case $FOLDER in
  *"true"*)
	hasCitra=true
esac

#RedDream?
FOLDER=$(test -d ~/storage/shared/Android/data/io.recompiled.redream && echo "true")
case $FOLDER in
  *"true"*)
	hasRedDream=true
esac
#YabaSanshioro?
FOLDER=$(test -d ~/storage/shared/Android/data/org.devmiyax.yabasanshioro2.pro && echo "true")
FOLDERPRO=~/storage/shared/Android/data/org.devmiyax.yabasanshioro2
case $FOLDER in
  *"true"*)
	hasYaba=true
esac
case $FOLDERPRO in
  *"true"*)
	hasYaba=true
esac
#Mupen64
FOLDER=$(test -d ~/storage/shared/Android/data/org.mupen64plusae.v3.fzurita && echo "true")
FOLDERPRO=~/storage/shared/Android/data/org.mupen64plusae.v3.fzurita.pro
case $FOLDERPRO in
  *"true"*)
	hasMupen=true
esac
case $FOLDER in
  *"true"*)
	hasMupen=true
esac
#PPSSPP
FOLDER=$(test -d ~/storage/shared/Android/data/org.ppsspp.ppsspp && echo "true")
FOLDERGOLD=~/storage/shared/Android/data/org.ppsspp.ppssppgold
case $FOLDER in
  *"true"*)
	hasPPSSPP=true
esac
case $FOLDERGOLD in
  *"true"*)
	hasPPSSPP=true
esac
#duckstation
FOLDER=$(test -d ~/storage/shared/duckstation && echo "true")
case $FOLDER in
  *"true"*)
	hasDuckstation=true
esac
#Drastic
FOLDER=$(test -d ~/storage/shared/DraStic && echo "true")
case $FOLDER in
  *"true"*)
	hasDrastic=true
esac
#DolphinMMJ
FOLDER=$(test -d ~/storage/shared/dolphin-mmjr && echo "true")
case $FOLDER in
  *"true"*)
	hasDolphinMMJ=true
esac

#Citra?
FOLDER=$(test -d ~/storage/shared/Android/data/skyline.emu && echo "true")
case $FOLDER in
  *"true"*)
	hasSkyline=true
esac