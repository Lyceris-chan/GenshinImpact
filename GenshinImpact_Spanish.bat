@echo off

rem Set the title of the command prompt
title GenshinImpact launcher script for Intel GPU users

rem Clear the screen of previous commands
cls

rem Credit: https://stackoverflow.com/questions/4051883/batch-script-how-to-check-for-admin-rights

rem Check if the script is being executed with admin priveleges (this is needed to change the process priority of the game later as its ran with admin priveleges as well)
goto check_Permissions

:check_Permissions
    echo Este script requiere permisos de Administrador para ajustar la prioridad de proceso del juego, Comprobando permisos de Admin...

    net session >nul 2>&1
    if %errorLevel%==0 (
        goto :information
    ) else (
        goto :elevate_Permissions
    )

    pause >nul

:elevate_Permissions
rem Credit: https://stackoverflow.com/a/25756858

rem Save current directory which lets us come back to our working directory
pushd %~dp0

net file 1>nul 2>nul && goto :information || powershell -ex unrestricted -Command "Start-Process -Verb RunAs -FilePath '%comspec%' -ArgumentList '/c %~fnx0 %*'"
goto :eof


rem Clear the screen and inform the users about what the script does
:information
cls
echo Hola Forastero!
echo.
echo Este script hara lo siguiente:
echo - Correra el juego con la configuracion grafica mas baja
echo - Forzara que se use DirectX11 para la renderizacion del juego
echo - Aumentara la prioridad del proceso del juego 30 segundos despues de iniciar el juego
echo.
echo. 
echo Creditos:
echo  - u/loltheybannedshaman por su trabajo en un hilo de reddit
echo  - Mathieu Squidward por su ayuda con unos problemas que tuve
echo  - ElectroAegis por ser un gran tester
echo  - Rob van der Woude por su revisador de codigo bat
echo  - La gente de stackoverflow
echo  - shirooo39 de Github por su ayuda con las resoluciones personalizadas
echo.
echo.
echo.

rem Wait for user input
pause

rem Clear the screen of previous commands
cls

rem Setup the %gamedirectory% so we can run the game with our launch options and change the process priority later on
call :1
call :2
call :3

rem Explenations for these subroutines can be found at their respective location


rem Clear the screen of previous commands
cls

:resolution_Selection
rem Clear the screen of previous commands
cls

rem Credit: https://github.com/shirooo39/Genshin-Impact-Set-Custom-Resolution

rem Ask the users at what resolution they want to play the game
echo ==================================================
echo  Genshin Impact    (Anchura: %screenWidth% - Altura: %screenHeight%)
echo ==================================================
echo.
echo  S. Establecer resolucion personalizada
echo  U. Lista de resoluciones preestablecidas
echo.
echo.
echo ==================================================
echo.
set /p i=Input: 
if /i "%i%"=="S" (
	set "i="
	goto resolution_Manual
)
if /i "%i%"=="U" (
	set "i="
	goto resolution_Presets
)

:resolution_Manual
cls
echo ==================================================
echo  Genshin Impact    (Anchura: %screenWidth% - Altura: %screenHeight%)
echo ==================================================
echo.
set /p screenWidth=Establezca Anchura : 
set /p screenHeight= Estableza Altura: 
goto confirmation

:resolution_Presets
cls
echo ==================================================
echo  Genshin Impact    (Anchura: %screenWidth% - Altura: %screenHeight%)
echo ==================================================
echo.
echo   1. 1366 x 768 (16:9)     5. 900  x 600 (16:9)
echo   2. 1280 x 720 (16:9)     6. 854  x 480 (16:9)
echo   3. 1024 x 576 (16:9)     7. 800  x 600
echo   4. 960  x 540 (16:9)
echo.
echo   0. Atras
echo.
echo ==================================================
echo.
set /p i=Input: 
if "%i%"=="1" (
	set "i="
	set screenWidth=1366
	set screenHeight=768
	goto confirmation
)
if "%i%"=="2" (
	set "i="
	set screenWidth=1280
	set screenHeight=720
	goto confirmation
)
if "%i%"=="3" (
	set "i="
	set screenWidth=1024
	set screenHeight=576
	goto confirmation
)
if "%i%"=="4" (
	set "i="
	set screenWidth=960
	set screenHeight=540
	goto confirmation
)
if "%i%"=="5" (
	set "i="
	set screenWidth=900
	set screenHeight=600
	goto confirmation
)
if "%i%"=="6" (
	set "i="
	set screenWidth=854
	set screenHeight=480
	goto confirmation
)
if "%i%"=="7" (
	set "i="
	set screenWidth=800
	set screenHeight=600
	goto confirmation
)
if "%i%"=="0" (
	set "i="
	goto resolution_Selection
) else (
	set "i="
	goto resolution_Selection
)

:confirmation
rem Clear the screen of previous commands
cls

rem Ask the user if they really want to run at (width: %screenWidth% - height: %screenHeight%)
echo Quiere correr el juego con la siguiente resolucion?:
echo.
echo.
echo Anchura: %screenWidth% - Altura: %screenHeight%
echo.
echo.
set /p i=Presione 1 para ejecutar el juego con la resolucion que usted indico, presione 2 para volver a la pantalla de seleccion de resolucion: 
if "%i%"=="1" (
	set "i="
	goto run_Genshin
) else (
	set "i="
	goto resolution_Selection
)

:run_Genshin
rem Clear the screen of previous commands
cls

rem Starting game with [-force-d3d11 -screen-width %screenWidth% -screen-height %screenHeight% -screen-quality lowest] This will run the game on its lowest graphical preset allong with running it in 800x600
echo Iniciando el juego...
start "" "%gamelocation%"\GenshinImpact.exe -screen-width %screenWidth% -screen-height %screenHeight% -force-d3d11 -screen-quality Fastest

rem Wait 30 seconds or until a user presses a key
timeout /t 30

rem Set the CPU priority to high
call "WMIC.exe" process where name="GenshinImpact.exe" CALL setpriority "128"

rem Clear the screen of previous commands
cls

rem Leave a nice message for the user
echo Ad astra abyssoque! Forastero.
echo.
echo.

rem Wait for user input
pause
exit /b

rem Check if the gameDirectory.txt is present,
rem If the file is not present prompt the user to enter the location at which the game executable is present
rem and save their input to gameDirectory.txt
:1
cls
echo.
if defined gamelocation (
	echo El directorio de su juego esta en: %gamelocation%
	echo.
)
if not exist "GameDirectory.txt" (
	echo Ejemplo: D:\Program Files\Genshin Impact\Genshin Impact Game
	echo.
	set /p gamelocation="Enter the location where the game is installed: "
	) else (
		rem Import the location of the game's executable to a variable called gamelocation
		set /p gamelocation=<"GameDirectory.txt"
)
exit /b

rem Check if the game's executable is present in %gamelocation%
:2
if not exist "%gamelocation%\GenshinImpact.exe" (
	echo.
	echo GenshinImpact.exe no encontrado, revise su directorio otra vez.
	echo.
	rem Delete GameDirectory.txt if found as the directory saved in it doesn't contain the game's executable
	if exist "GameDirectory.txt" del /f /q "GameDirectory.txt"
	rem Prompt the user to enter the directory in which GenshinImpact.exe is located
	goto 1
)
exit /b

rem Save %gamelocation% to a text file called gameDirectory in the same folder as this script is ran from ("%cd%"")
:3
echo %gamelocation%>"GameDirectory.txt"
exit /b
