@echo off
rem Set the title
title Lacia's GenshinImpact.bat script

rem Clear the screen of previous commands
cls

rem Tell users what this script will do.
echo This script will set the graphics quality to its lowest / the fastest preset and it will launch the game

rem Wait for user input
pause

rem Set the graphics settings to low with a registery tweak.

rem Clear the screen of previous commands
cls

echo Setting the graphics quality to low please wait
reg import lowgraphics.reg
timeout /t 2 /nobreak > NUL

rem Clear the screen of previous commands
cls

rem Let the users know that we changed the graphics for them

rem Clear the screen of previous commands
cls

echo Done setting the graphics preset to fastest.
timeout /t 2 /nobreak > NUL

rem Wait for user input

rem Clear the screen of previous commands
cls

pause

rem Clear the screen of previous commands
cls


rem Let the user enter the location where the game is installed
echo Example: D:\Program Files\Genshin Impact\Genshin Impact Game
set /p gamelocation="Enter the location where the game is installed: "


rem Starting game with -force-d3d11 and launch it in 800x600
echo Starting the game...
"%gamelocation%"\GenshinImpact.exe -screen-width 800 -screen-height 600 -force-d3d11
pause