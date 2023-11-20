
# Setup and Usage

## Downloading and Install

First, download the script by clicking the big "Code" button at the top right of the main repo page, then clicking "Download ZIP." Once it downloads, you can extract the zip file wherever you like.

Make sure to show hidden files. This can be done by pressing Command + Shift + `.` (Period)

Then move the `.scripts` folder into your home (user) folder. You can quickly open this by pressing Command + Shift + H

You are free to change the location of the scripts to your liking, but you'll have to adjust the location that the other commands in this guide use.


## Script Configuration

Now open the `.scripts` folder and open `video-mover.sh` in your preferred text editor to set up the script.

The script has three variables that you need to set in order for the script to properly run.

The first, `downloadFolder`, defines the folder the script will look in for a file, presumably a video file. 

The second, `finalFolder`, is the location where the file will be moved to by the script.

Both of these need to be the absolute path of the file in order to work properly. An example of an absolute path would be:
```sh
/Users/video-mover-user/Videos/To-Move
```

You can get the absolute path of a file or folder by right clicking on it, then holding down option, then click on "Copy "FileName" as Pathname." This can then be pasted or typed into the script inside of the quotation marks.

So for the example given above, the line where we set `downloadFolder` would look something like this:
```sh
downloadFolder="/Users/video-mover-user/Videos/To-Move"
```

The last variable is the name you want the final file to be, which would look something like `moved-video.mp4`. Similarly, this needs to be put inside of the quotation marks:
```sh
finalName="moved-video.mp4"
```

You don't need to set the original file's name, since the program will automatically move the most recently modified file. Do keep this in mind though when setting up your folders, it will copy the most recent of ***ANY*** file. Be careful!


## Scheduling/Automation Setup

Next, to make the script executable you need to first open a terminal and type in `cd ~/.scripts` and press enter to switch your current directory to the `.scripts` folder, then run this command:
```sh
chmod +x video-mover.sh`
```

Finally, you'll need to schedule the script to run at your desired time. I recommend using cron but you can use something else if you want to.

To begin setting up the script with cron, open your terminal if you haven't already, and then run this command: 
```sh
crontab -e
```

You should be presented with a blank file opened in Vim, a terminal based text editor. 

To start editing the file, press `i`.

To add your schedule for the script, type in in the following:
```
MM HH * * * cd ~/.scripts && ./video-mover.sh
```

**Important:** Replace MM and HH with the minute and hour you want the command to run each day, respectively. This uses 24 hour time, so 8am would be 08, and 9pm would be 21.

For example, the config to have the script run every day at 8:30 in the morning would look like this:
```
30 08 * * * cd ~/.scripts && ./video-mover.sh
```

Press escape to stop editing. Then press `:` to open the command window inside the editor, and type in `wq` and then press enter to save and quit.

Your system should now run the `video-mover.sh` script. 

If you want to edit the schedule for the script, simply run `crontab -e` and use the same commands as before to edit the file.

To delete or disable the schedule, either remove the line defining the schedule, or add a hashtag (`#`) to the beginning of the line to disable it.

For more information about using cron, see the following links:
- [cron - Wikipedia](https://en.wikipedia.org/wiki/Cron)
- [CronHowto - Community Help Wiki](https://help.ubuntu.com/community/CronHowto)

