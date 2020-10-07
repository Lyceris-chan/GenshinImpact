@echo off

rem Make the terminal window wide so all the info fits // lets hope no one uses a small monitor >.>.
mode con: cols=10000 lines=40

rem Set the title for the CMD prompt
title Lacia's Genshin Impact setup script

rem Clear the screen of previous commands
cls

rem Warn the users to continue on their own risk
echo Hey user this script will make changes to your registery and will guide you on how to install an older driver which should help fix the crashes / freezes in the popular gacha game Genshin Impact.
echo Continue at your own risk.
echo. 

rem Wait for user input
pause

rem Clear the screen of previous commands
cls
 
echo There are graphics drivers included in this folder/zip which are located in
echo %cd%\win64_154702.4815
echo.
echo These drivers can be used on the following Intel(R) GPU's:
echo.
echo 8th Generation Intel Core processors with Intel UHD Graphics 610, 620, 630.
echo.
echo 7th Generation Intel Core processors, related Pentium/ Celeron Processors, and Intel Xeon processors, with Intel Iris Plus Graphics 640, 650 and Intel HD Graphics 610, 615, 620, 630, P630.
echo.
echo 6th Generation Intel Core processors, Intel Core M, and related Pentium processors, with Intel Iris Graphics 540, Intel Iris Graphics 550, Intel Iris Pro Graphics 580, and Intel HD Graphics 510, 515, 520, 530.
echo.
echo Intel Xeon processor E3-1500M v5 family with Intel HD Graphics P530
echo.
echo Pentium/Celeron Processors with Intel HD Graphics 500, 505.
echo.
echo.

rem Wait for user input
pause

rem Clear the screen of previous commands
cls

rem Tell the users how to install the driver
echo The driver can be found in 
echo.
echo %cd%\win64_154702.4815\Graphics
echo.
echo Press Windows key + r and a window will pop up called run.
echo.
echo Type in: devmgmt.msc and it will open device manager
echo.
echo Click on display adapters and you should see your Intel(R) - GPU there.
echo.
echo Right click on the Intel(R) etc and click on update driver (this will open a new window)
echo.
echo Click on Browse my computer for drivers.
echo.
echo Click on Let me pick from a list of available drivers on my computer.
echo.
echo Click on Have disk... and navigate to
echo %cd%\win64_154702.4815\Graphics
echo.
echo And click on igdlh64.inf (it might now show the inf extension just click on the file)
echo.
echo Then click on open and then click on OK
echo.
echo It will now show the driver now click on Next and it will install the driver.
echo.
echo When the driver is done installing restart your PC and run GenshinImpact.bat
echo.
echo.
echo You can now press a key for the script to close on its own all you have to do is restart your PC and to start GenshinImpact.bat from 
echo %cd%
echo.
echo.

rem Wait for user input
pause