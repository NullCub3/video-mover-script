# Video Mover Script

A quick and dirty bash script to rename and move some video files around.

## How to Set Up and Use

1. Download the script by clicking the big "Code" button at the top right of the main repo page, and then clicking "Download ZIP"

2. Extract the zip file wherever you like

3. Make sure to show hidden files

4. Move the `.scripts` folder into your home (user) folder

5. Open a terminal and type in`cd ~/.scripts` and press enter to switch your current directory to the `.scripts` folder.

6. Run this command to make the script executable: `chmod +x video-mover.sh`

7. Next, schedule the script to run at your desired time. This can be done with your own method of choice, or with the following method:

### Using cron to Schedule Running the Script

Open your terminal if you haven't already, and run this command: `crontab -e`

You should be presented with a blank file opened in Vim inside the terminal. Press `i` to start editing.

Type in in the following:
```
MM HH * * * cd ~/.scripts && ./video-mover.sh
```

Replace MM and HH with the minute and hour you want the command to run each day, respectively. This uses 24 hour time, so 8am would be 08, and 9pm would be 21.

Press escape to stop editing. Then press `:` to open the command window inside the editor, and type in `wq` and then press enter to save and quit.

Your system should now run the `video-mover.sh` script. If you want to edit when the script runs, simply run `crontab -e` and use the same commands as before to edit. If you want to quickly delete the schedule, pressing `dd` if you're in normal mode (the not text editing mode) will delete the line underneath the cursor.

For more information about using cron, see the following links:
- [cron - Wikipedia](https://en.wikipedia.org/wiki/Cron)
- [CronHowto - Community Help Wiki](https://help.ubuntu.com/community/CronHowto)

