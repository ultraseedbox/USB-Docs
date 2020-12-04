#### Why are Ombi’s movie & TV Shows search function not working?

Recent versions of Ombi, when upgraded, had some issues with their database. To fix this, run the following command on your slot’s shell.

```sh
rm -f “$HOME”/.config/ombi/OmbiExternal.db && app-ombi upgrade
```

#### Why are Ombi’s movie & TV shows requests to Radarr and/or Sonarr not working?

Please check your Ombi connection settings if they’re correct. Please check the guide [here ](https://docs.usbx.me/books/ombi/page/ombi-client-connection-details)and compare it to yours.