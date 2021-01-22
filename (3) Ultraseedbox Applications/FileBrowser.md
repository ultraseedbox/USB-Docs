
## File Browser

File browser provides a file managing interface within your home directory and it can be used to upload, delete, preview, rename and edit your files. All from within your web browser.

### Login Prompt

![]( <https://i.imgur.com/EJMqELz.png>)

### After login

![]( <https://i.imgur.com/wNttIEV.png>)



### Left panel Options

![]( <https://i.imgur.com/i4XwtiC.png>)


| Option     | Action                                                             |
|:------------:|:--------------------------------------------------------------------:|
| My Files   | Brings you back to your h=Home Directory                           |
| New Folder | Create new empty folder in current directory                       |
| New File   | Create new empty file in current directory                         |
| Settings   | Various settings including language, Theme and user creation rules |
| Logout     | Logout of current session                                          |

## Downloading and uploading files

File Browser allows you to upload and download files directly from the web UI using the array of icons in the top right corner of the page

![]( <https://i.imgur.com/E5MH5d0.png>)



During upload and downloading FileBrowser will display a light blue bar in the top left-hand corner moving right to indicate progress, It is also confirmed as in progress by the changing of the icon on the right-hand side into spinning arrows
![](https://i.imgur.com/GsksbLA.png)

## Adding a User and Setting file access

Under Settings, you will find the option to create a user.

![](https://i.imgur.com/QOk0Rwj.png)

![](https://i.imgur.com/e3VScTo.png)

By Clicking the button new you will be presented with the fields required to create a new user:
![](https://i.imgur.com/e3VScTo.png)

![](https://i.imgur.com/kfABePV.png)

![](https://i.imgur.com/n6tWtz0.png)


![](https://i.imgur.com/NptujM1.png)


| Field       | Use                                                                                                                                                                                                                                                                                                         |
|:-------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
| Username    | Desired Username for user                                                                                                                                                                                                                                                                                   |
| Password    | Desired Password for user                                                                                                                                                                                                                                                                                   |
| Scope       | This is an important option as this will be the folder the user may access. In this example, it is set to \`./share\` which is \`/home1/username/share \*\*Note: It is not recommended to point this directly to a rclone mount as this will cause extreme IO and possibly cause issues with your slot \*\* |
| Permissions | You can set the kind of actions a user can perform, for example, you may want to allow download but never allow upload so that a user can not deposit files onto your slot. You’d untick create Files and Directories                                                                                       |
