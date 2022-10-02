#!/bin/bash

#Expert mode off by default
expert=false

#Device customs
hasSDCARD=false
devicePower=0
deviceAR=169
android=10
#All Emus are off since their installation depends on the device selected
#Default settings for all systems
doSetupRA=true
doSetupDolphin=true
doSetupPCSX2=true
doSetupCitra=true
doSetupDuck=true
doSetupPPSSPP=true
doSetupSkyline=true
doSetupDrastic=true

#Install all systems by default
doInstallRA=false
doInstallDolphin=false
doInstallPCSX2=false
doInstallCitra=false
doInstallDuck=false
doInstallPPSSPP=false
doInstallSkyline=false
doInstallDrastic=false

#Default RetroArch configuration 
RABezels=true
RAautoSave=false

#Default installation folders
emulationPath=$HOME/storage/shared/Emulation
romsPath=$HOME/storage/shared/Emulation/roms
toolsPath=$HOME/storage/shared/Emulation/tools
biosPath=$HOME/storage/shared/Emulation/bios
savesPath=$HOME/storage/shared/Emulation/saves
storagePath=$HOME/storage/shared/Emulation/storage

#New UI settings
achievementsPass=false
achievementsUser=false
arClassic3D=43
arDolphin=43
arSega=43
arSnes=43
RAHandClassic2D=false
RAHandHeldShader=true
doSetupSaveSync=false

doInstallPegasus=true
doInstallDaijisho=true
doInstallDig=false
doInstallLaunchbox=false
doInstallReset=false
doInstallArc=false

doInstallThemeEpic=true
doInstallThemeSwitch=true
doInstallThemeMega=true
doInstallThemeGameOS=true
doInstallThemeNeoRetro=true