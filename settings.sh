#!/bin/bash

#Expert mode off by default
expert=false

#Device customs
hasSDCARD=false
devicePower=0 # 0, 1, 2
deviceAR=169
android=10


#Default settings for all systems
doSetupRA=true
doSetupDolphin=true
doSetupPCSX2=true
doSetupCitra=true
doSetupDuck=true
doSetupPPSSPP=true
#doSetupMelon=true

#Install all systems by default
doInstallRA=false
doInstallDolphin=false
doInstallPCSX2=false
doInstallCitra=false
doInstallDuck=false
doInstallPPSSPP=false
#doInstallMelon=false
doInstallCHD=false


#Default RetroArch configuration 
RABezels=true
RAautoSave=false

#Default installation folders
emulationPath=~/Emulation
romsPath=~/Emulation/roms
toolsPath=~/Emulation/tools
biosPath=~/Emulation/bios
savesPath=~/Emulation/saves
storagePath=~/Emulation/storage
ESDEscrapData=~/Emulation/tools/downloaded_media

#Default ESDE Theme
esdeTheme="EPICNOIR"


#Advanced settings
doSelectWideScreen=false
doRASignIn=false
doRAEnable=false
doESDEThemePicker=false
doSelectEmulators=false
doResetEmulators=false
XemuWide=false

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