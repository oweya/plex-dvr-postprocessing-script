SET infile=%1
SET tmpfile=%1.mp4
SET scriptlog=F:\PlexStuff\dvrpostprocesslog.txt
SET handbrakepath="D:\Program Files\HandBrake\HandbrakeCLI.exe"
SET handbrakepresetpath=F:\plexstuff\plexdvrhandbrakesettings.json

ECHO.
ECHO Starting processing %date% %time%>> %scriptlog%
ECHO Starting handbrake transcode %date% %time%>> %scriptlog%

REM use handbrake to compress the ts into an mp4
%handbrakepath% --preset-import-file %handbrakepresetpath% -Z "PlexDVR" -i %infile% -o %tmpfile%

ECHO Finished transcode %date% %time%>> %scriptlog%
ECHO Starting ffmpeg file conversion %date% %time%>> %scriptlog%

REM use ffmpeg to convert the mp4 back into a ts
ffmpeg -i %tmpfile% -f mpegts -vcodec copy -acodec copy -y %tmpfile%

ECHO Finished conversion %date% %time%>> %scriptlog%
ECHO Moving file %tmpfile% to %infile%>> %scriptlog%

REM replace the original ts file with the compressed version
move /Y %tmpfile% %infile%

ECHO Finished moving>> %scriptlog%

ECHO Finished processing %date% %time%>> %scriptlog%
ECHO.
ECHO.
