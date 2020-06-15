@ECHO OFF
POWERSHELL -command "Invoke-WebRequest "https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.ps1" | Invoke-Expression"
TIMEOUT 5 >NUL
spicetify
spicetify restore backup
spicetify backup apply enable-devtool
SET DIR=%cd%
ECHO.
ECHO Do you want to install a few themes as well?
ECHO.
ECHO 1. Yes
ECHO 2. No
SET choice=
SET /p choice=
IF '%choice%'=='1' GOTO THEMES
IF '%choice%'=='2' GOTO END
:THEMES
POWERSHELL -command "Expand-Archive -LiteralPath 'Themes.zip' -DestinationPath %cd%"
TIMEOUT 5 > NUL
CD %DIR%\Themes\Flatten
COPY "%DIR%\Themes\Flatten\color.ini"  "C:\Users\%username%\spicetify-cli\Themes"
COPY "%DIR%\Themes\Flatten\user.css"  "C:\Users\%username%\spicetify-cli\Themes"
COPY "%DIR%\Themes\Flatten\user.sass"  "C:\Users\%username%\spicetify-cli\Themes"
CD %DIR%\Themes\Bloody
COPY "%DIR%\Themes\Bloody\color.ini"  "C:\Users\%username%\spicetify-cli\Themes"
COPY "%DIR%\Themes\Bloody\user.css"  "C:\Users\%username%\spicetify-cli\Themes"
:END
