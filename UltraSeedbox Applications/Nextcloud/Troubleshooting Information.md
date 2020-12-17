#### I am unable to upload files more than the size of 10MB on Nextcloud. How to resolve it? 

This is a default limitation of your nginx instance, as it is not needed by most of our clients. Run the following command to your slot’s shell to be able to upload more than 10MB.

```sh
sed -i 's|client_max_body_size .*;|client_max_body_size 0;|g' "$HOME"/.apps/nginx/nginx.conf && app-nginx restart
```