# Qlocker-Recovery

These scripts can be used to automatically unlock the files that have been locked by QLocked hacker attack. 
Unlocking is a three (or four) step process to ensure no files are lost due to errors.
There is another helper script named count7z.sh which counts all the 7z files. You may want to run it after qunlock.sh has been run.

Steps:
1) SSH to your NAS with admin account (Google it you will find youtube videos as well)
2) Once in the NAS copy these two scripts to root directory using scp (google on how to if you don't know)
3) In recovery.sh replace the password of you 7z files at line #3
4) In the root directory run count7z.sh by running ./count7z.shd (This is optional)
5) This will list and provide of all the 7z compressed files in the disk (Optional)
6) First run the sanitize_dirs_recurrsively.sh script in the root directory. It will remove any spaces or dots or braces from directory names.
   This is needed because 7z script doens't like it.
7) Secondly run the sanitize_7z_files_recurrsively.sh script. It will removes spaces and chars from all 7z files.
8) Now run recovery.sh. It will unlock all 7z files.
9) 7z restores original files names so if you want to remove spaces and chars from file names run sanitize_any_file_recurrsively.sh. This is optional
10) There are other helper scripts like count_7z_files.sh and count_all_files.sh
11) Wait for it to finish. It may take many hours or even depending upon how many files you may have.
12) If it disconnects start with step 1 again.
13) Run ./count7z.sh to see how many files are left if any. 

