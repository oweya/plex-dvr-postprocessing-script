# plex-dvr-postprocessing-script
Windows batch script that will compress a Plex TV recording.  Requires HandBrakeCLI and FFmpeg.

Plex records a show as a transport stream (ts) file which can be rather large in size but helpfully 
provides the option to run a post-processing script.

This script compresses the ts to an mp4 using handbrake then converts the mp4 back to a ts using ffmpeg.  
The original uncompressed ts is then overwritten with the newly compressed ts.


