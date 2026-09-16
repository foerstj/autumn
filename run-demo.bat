:: path of Bits dir
set bits=%~dp0.
:: path of DS installation
set ds=%DungeonSiege%

:: Compile resource file
call "%bits%\build.bat" %*

:: Compile demo map file
set copyright=CC-BY-SA 2026
set author=Johannes Förstner
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\world\maps\autumn-demo" "%tmp%\Bits\world\maps\autumn-demo" /E
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\An Autumn Mod-demo.dsmap" -copyright "%copyright%" -title "%map_cs%" -author "%author%"
if %errorlevel% neq 0 pause

::pause

:: Run it!
"%ds%\DSLOA.exe" nointro=true map=autumn-demo

:: Cleanup resources so as not to confuse Siege Editor
call "%bits%\cleanup.bat" %*
