# Qlocker-Recovery

This script can be used to automatically unlock the files that have been locked by QLocked hacker attack. The script goes through all directories and files starting from where the script is run and unlocks all files.

THE SCRIPT HAS TO BE RUN AT LEAST TWO TIMES
First time it unlocks and leaves both locked as well as unlocked files in the same place. It gives you the chance to take a look at the files and review if needed also it avoid unwanted deleting of files if something goes wrong during uncompression. 
Second time when you run it, it finds which files have been uncompressed successfully and then deletes the compressed file..

There is another helper script named count7z.sh which counts all the 7z files. You may want to run it after qunlock.sh has been run.

Steps:
1) SSH to your NAS with admin account (Google it you will find youtube videos as well)
2) Once in the NAS copy these two scripts to root directory using scp (google on how to if you don't know)
3) In qunlocker.sh replace the password of you 7z files at line #3
4) In the root directory run count7z.sh by running ./count7z.shd
5) This will list and provide of all the 7z compressed files in the disk
6) Now run qunlock.sh by running ./qunlock.sh
7) Wait for it to finish. It may take many hours or even depending upon how many files you may have.
8) If it disconnects start with step 1 again.
9) Run ./qunlock.sh again after the first pass to delete already extracted 7z files.
10) Run ./count7z.sh to see how many files are left. 
11) Repeat steps 5 to 9 as many times as needed until ./count7z.sh doesn't say 0 files!

