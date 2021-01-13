In this guide, we'll be setting up Traktarr for the first time. This guide
assumes the following:

-   You have a working Sonarr/Radarr

-   You have a working Trakt.tv account

-   Are willing to run experimental scripts

## Initial Setup

## Creating folder structure and pulling the Traktarr Script from github

If you don’t already have a “scripts” folder on your slot you will need to
create one using the command `mkdir ~/scripts` enter the dir with `cd
~/scripts`. Now we need to pull Trakarr from github with the following
command `git clone https://github.com/l3uddz/traktarr ~/scripts/trakarr`
and set its owner as your own `chown -R usbdocs:usbdocs \~/scripts/trakarr`.

## Installing Python for your user

It is required to install python on your slot to operate Trakkarr but doing so
is considered experimental.

```

wget
https://raw.githubusercontent.com/ultraseedbox/UltraSeedbox-Scripts/master/Language%20Installers/python-pip-install.sh

chmod +x python-pip-install.sh

bash python-pip-install.sh

```

You may need to run this twice as sometimes it may fail this is totally fine.

After the script completes reload your shell environment with this command \`
exec /bin/bash\` followed by \` python3 -m pip install -r requirements.txt\` to
install all of Traktarr’s requirements.

## Creating the Trakt.tv Application

1.  Create a Trakt application by going to
    https://trakt.tv/oauth/applications/new

2.  Enter a name for your application; for example `traktarr`

3.  Enter `urn:ietf:wg:oauth:2.0:oob`  in the `Redirect uri` field.

4.  Click "SAVE APP".

## Creating the Configuration and filling it in

To create Tracktarr configuration you will need to run it for the first time,
First make sure you are inside the Tracktarr folder in ~/scripts/ run the
command `cd ~/scripts/trakarr` and run tracktarr with `./trakarr.py run` .

You should be presented with the following message

`Dumping default config to: /homeXX/username/scripts/trakarr/config.json`

The path will be slightly different for you but be sure to keep a note of this
as this is what we will be editing.

The Tracktarr script offers many options which would be impossible to cover in
this guide so we will cover only the values that will render Trackarr
functional. If you’d like to dig deeper more information can be found here (<https://github.com/l3uddz/traktarr#configuration>).

Before we continue to the next section it is a good idea to grab the following
Items you can find out the full path of your home and username with `pwd`

-   Media Storage paths ( /homeXX/username/media/Movies ,
    /homeXX/username/media/TV for example)

-   Sonarr API Key

-   Radarr API Key

-   One Sonarr Quality profile

-   One Radarr Quality profile

### Values required to fill and their function

| Filters                 | Values                                                                                       |
|:-------------------------:|:----------------------------------------------------------------------------------------------:|
| allowed_countries       | Add the countries you’d like content from. Codes should be separated by commas (“gb”,”us”)   |
| allowed_languages       | Add the Language you’d want your content in. Codes should be separated by commas (“en”,”fr”) |
| blacklisted_genres      | Genres that should be skipped during a search.                                               |
| blacklisted_max_runtime | This will block any files being accepted that have a certain number of minutes of runtime    |
| blacklisted_max_year    | Blacklist anything with a release date to far into the future                                |
| blacklisted_min_runtime | This will block any files being accepted that have a certain number of minutes of runtime    |
| blacklisted_min_year    | Blacklist anything with a release date to far into the past                                  |

| Filters                 | Values                                                                                       |
|:-------------------------:|:----------------------------------------------------------------------------------------------:|
| allowed_countries       | Add the countries you’d like content from. Codes should be separated by commas (“gb”,”us”)   |
| allowed_languages       | Add the Language you’d want your content in. Codes should be separated by commas (“en”,”fr”) |
| blacklisted_genres      | Genres that should be skipped during a search.                                               |
| blacklisted_max_runtime | This will block any files being accepted that have a certain number of minutes of runtime    |
| blacklisted_max_year    | Blacklist anything with a release date to far into the future                                |
| blacklisted_min_runtime | This will block any files being accepted that have a certain number of minutes of runtime    |
| blacklisted_min_year    | Blacklist anything with a release date to far into the past                                  |


| Sonarr               | Value                              |
|:----------------------:|:------------------------------------:|
| api_key              | Sonarr API key                     |
| minimum_availability | This can be set to “announced”     |
| language             | Chosen Sonarr Language             |
| root_folder          | Path of your Media folder          |
| url                  | username.servername.usbx.me/sonarr |


| Trakt         | Value                |
|:---------------:|:----------------------:|
| client_id     | your_trakt_client_id |
| client_secret | your_trakt_client_id |


## Testing and using tracktarr via Command Line

### Movies

-   Add the movie "Movie name (year)":

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
traktarr movie -id Movie-Name-2021
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   Add movies, from the popular list, labeled with the thriller genre, limited
    to 5 items, and sorted by latest release date.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
traktarr movies -t popular -g thriller -l 5 -s release
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   Add movies, from the Box Office list, labeled with the comedy genre, limited
    to 10 items, and send notifications:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
traktarr movies -t boxoffice -g comedy -l 10
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   Add movies, from a list of most watched played this week, and limited to 5
    items.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
traktarr movies -t watched -l 5
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   Add movies, from a list of most played movies this month, and limited to 5
    items.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
traktarr movies -t played_monthly -l 5
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   Add (all) movies from the public list
    `https://trakt.tv/users/rkerwin/lists/top-100-movies`:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
traktarr movies -t https://trakt.tv/users/rkerwin/lists/top-100-movies
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   Add (all) movies from the private list
    `https://trakt.tv/users/user1/lists/private-movies-list` of `user1`:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
traktarr movies -t https://trakt.tv/users/user1/lists/private-movies-list --authenticate-user=user1
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   Add movies, from the trending list, with a minimum Rotten Tomatoes score of
    80%.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
traktarr movies -t trending -rt 80
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   Add movies, with actor 'First Last', limited to 10 items.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
traktarr movies -t person -a 'First Last ' -l 10
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   Add movies, with actor 'First Last', including movies where he has
    non-acting roles, limited to 10 items.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
traktarr movies -t person -a 'First Last' --include-non-acting-roles -l 10
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Shows

-   Add the show "Flash Gordon":

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
traktarr show -id Flash-Gordon
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   Add shows, from the popular list, limited to 5 items, and sorted by highest
    ratings.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
traktarr shows -t popular -l 5 -s rating
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   Add shows, from the popular list, limited to 2 items, and add them but don't
    search for episodes in Sonarr:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
traktarr shows -t popular -l 2 --no-search
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   Add shows, from a list of most watched shows this year, and limited to 5
    items.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
traktarr shows -t watched_yearly -l 5
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   Add shows, from a list of most played shows this week, and limited to 5
    items.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
traktarr shows -t played -l 5
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   Add shows, from a list of most played shows of all time, and limited to 5
    items.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
traktarr shows -t played_all -l 5
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-   Add (all) shows from the watchlist of `user1`:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
traktarr shows -t watchlist --authenticate-user user1
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
