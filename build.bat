:: name of mod
set mod=autumn
:: name of mod, case-sensitive
set mod_cs=An Autumn Mod

:: path of Bits dir
set bits=%~dp0.
:: path of DS installation
set ds=%DungeonSiege%
:: path of TankCreator
set tc=%TankCreator%

set copyright=CC-BY-SA 2026
set author=Johannes Förstner

:: Compile main resource file
rmdir /S /Q "%tmp%\Bits"
robocopy "%bits%\art" "%tmp%\Bits\art" /E /xf .gitignore /xf *.psd /xd new
robocopy "%bits%\world\contentdb\templates" "%tmp%\Bits\world\contentdb\templates" /E
robocopy "%bits%\world\global\moods" "%tmp%\Bits\world\global\moods" /E
"%tc%\RTC.exe" -source "%tmp%\Bits" -out "%ds%\DSLOA\%mod_cs%.dsres" -copyright "%copyright%" -title "%mod_cs%" -author "%author%"
if %errorlevel% neq 0 pause

:: Cleanup
rmdir /S /Q "%tmp%\Bits"
