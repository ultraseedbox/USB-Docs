The terminal is your gateway to the inner workings of your UltraSeedbox slot. It is essentially a remote computer running Linux, and when you SSH into it you are connecting to that computer's terminal.

A terminal is a powerful tool where you can execute written commands to perform many simple or even very complicated tasks. This guide will help you understand a few simple commands to get you started in navigating and making use of the Linux terminal, it can also serve as a cheat sheet later down the track if you need to recall anything you may have forgotten.

***

## Navigation

In this section we will detail the commands used to move between directories in Linux, we will also cover how to find your location and the structure of your slot.

### cd

The first thing you are going to want to do in your terminal is navigate between directories. All tasks are performed within different directories, and your current directory affects how a command may run or how you may need to use a command.

When you first SSH into your slot, you will be in your personal **home** directory. This is the location of all your files, anything you wish to accomplish must be done within the **home** directory as this is the only folder you have read, write and execute permissions for. If while navigating your terminal you wish to return to your **home** directory, you can do so by typing `cd ~`.

This brings us to the command you will likely find yourself using a large amount of the time; `cd`. This command is used to navigate between different directories in Linux and stands for _change directory_. To use this command you simply type `cd` followed by the directory you wish to navigate to.

In Linux when navigating using the `cd` command, there are multiple ways to tell the operating system where exactly you want to be. If for example you want to move one directory deeper from a directory you are already in you would use `cd [directory]`. If you know the directory structure already and you simply want to go to a path relative to your current location you can use `cd path/to/directory` where each / stands for a directory deeper. Just like `~` refers to the **home** directory `/` refers to the root of the filesystem. If for example you wanted to navigate to a folder called **media** in your **home** directory you would use the command `cd ~/media`.

It is also worth noting that in Linux `.` refers to the current working directory and `..` refers to the directory above. This is useful in if you want to go back one directory you can type `cd ..`, or if you want to go back two you can use `cd ../..` and so on.

### ls

Knowing how to navigate your directories is all well and good but how do you know where you actually want to go? For this we use the `ls` command. Typing `ls` within any directory in Linux will instantly show you all the folders in said directory. You can also use `ls` to list the directories inside a different directory using `ls path/to/directory`.

### pwd

The `pwd` command is used to show you the exact location you are currently in, fairly simple really. Running `pwd` will print the full path to your current working directory. Very useful for when you may be lost.

## File and Directory Manipulation

At some point you are going to want to move files/directories around, copy or delete them. Here we will cover the commands involved in achieving this.

### mv

The `mv` command stands for _move_, you can use it to move a file or directory to another directory. It is as simple as using the command `mv [file or directory you wish to move] [where you wish to move it]`. For example if you wanted to move a directory called **media** to a directory called **files** you'd use the command `mv media files` if however you wish to move all the files from the directory called media into the directory called files you'd use `mv media/* files` this tells the operating system to move all the files (signified by `/*`) located in media.

### cp

The `cp` command stands for _copy_, it is used in much the same way as `mv` however there are a few little details worth covering. The general syntax is the same as `mv`; if you wish to copy a file in your current directory named **Movie1.mkv** to a sub directory called **media** you'd used the command `cp Movie1.mkv media`. The difference comes when you wish to copy an entire directory. When you want to copy an entire directory you need to tell the `cp` command to copy _recursively._ This is signified with a `-r` after the `cp`. For example if you wished to copy the directory called **media** to **files** similar to the previous example you'd use the command `cp -r media files`. Copying all the files within media to files is pretty much exactly the same; `cp media/* files`. However, if there are any sub-directories within **media** that you also wish to copy, you again need to use the -r flag; `cp -r media/* files`. The -r flag is used whenever you need to copy an _entire directory_.

### rm

The rm command stands for _remove_, it is used to delete files or directories you no longer wish to use. **It is very important to keep in mind that there is no recycling bin in Linux, any files you delete are permanently lost.** Syntax for rm is much the same as cp if you wish to remove a file named **Movie1.mkv** you'd simply type `rm Movie1.mkv`. If you wish to remove an entire directory, once again you need to use the `-r` flag; `rm -r media` would delete the entire **media** directory. If you wanted to remove all the files inside the **media** directory, you'd use `rm media/*` or `rm -r media/*` if there are directories inside the media.

### Further Info

For any commands you need to find more information on you can use the command `man [command]`. This displays a manual page for the specified command.

***

## UltraSeedbox Specific Commands

### Application Management

When interacting with your seedbox through Secure Shell you may wish to manipulate the applications we offer one-click installers for, to do this you use the `app-[appname]` commands.

#### Installing and Uninstalling Apps

To install an application we can use the command `app-[appname] install`. This can be helpful to gain further knowledge as to why certain installations are failing. When installing an application you will be presented with an output in the SSH prompt showing either true or false.

Likewise, to uninstall an application we can use the command `app-[appname] uninstall`. This is especially useful in the case of an application saying it's installed while not being accessible from the UCP.

#### Stop, Start and Restarting Apps

To change the running state of an application we use `app-[appname] [start|stop|restart]`. These commands will be useful for you throughout the usage of your USB slot for troubleshooting or further customizing your experience.

#### Further Info

For further information regarding specific commands for a particular application run `app-[appname] help`. This will provide all sub-commands available for the said app.