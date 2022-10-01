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
RABezels=false
RAautoSave=false

#Default installation folders
emulationPath=$HOME/Emulation
romsPath=$HOME/Emulation/roms
toolsPath=$HOME/Emulation/tools
biosPath=$HOME/Emulation/bios
savesPath=$HOME/Emulation/saves
storagePath=$HOME/Emulation/storage

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

doInstallPegasus=false
doInstallDaijisho=true
doInstallDig=false
doInstallLaunchbox=false
doInstallReset=false
doInstallArc=false

doInstallThemeEpic=false
doInstallThemeSwitch=false
doInstallThemeMega=false
doInstallThemeGameOS=false
doInstallThemeNeoRetro=false