# Qlocker-Recovery

The script qunlocker.sh can be used to automatically unlock the files that have been locked by QLocked hacker attack. The script goes through all directories and files starting from where the script is run and unlocks all files. It is the safest script compared to qunlocker2.sh which will explain towards the end of this README

THE SCRIPT qunlocker.sh HAS TO BE RUN AT TWO TIMES

First time it unlocks and leaves both locked as well as unlocked files in the same place. It gives you the chance to take a look at the files and review if needed also it avoid unwanted deleting of files if something goes wrong during uncompression. Second time when you run it, it finds which files have been uncompressed successfully and then deletes the compressed file..

There is another helper script named count7z.sh which counts all the 7z files. You may want to run it after qunlock.sh has been run.

Steps:
1) SSH to your NAS with admin account (Google it you will find youtube videos as well)
2) Once in the NAS copy these two scripts to root directory using scp (google on how to if you don't know)
3) In qunlocker.sh replace the password of you 7z files at line #3
4) In the root directory run count7z.sh by running ./count7z.shd (This is optional)
5) This will list and provide of all the 7z compressed files in the disk (Optional)
6) Now run qunlock.sh by running ./qunlock.sh
7) Wait for it to finish. It may take many hours or even depending upon how many files you may have.
8) If it disconnects start with step 1 again.
9) Run ./qunlock.sh again after the first pass to delete already extracted 7z files.
10) Run ./count7z.sh to see how many files are left. 
11) Repeat steps 5 to 9 as many times as needed until ./count7z.sh doesn't say 0 files!


Why qunlocker2.sh?
I found that sometimes if the file names have multiple spaces in the file names or have some weird characters, it doesn't extract the file. qlocker2.sh would first replace all weird characters in the file name and then extract and deleted the 7z file in one go. I would prefer to use the first script unless you have to use qlocker2.sh

