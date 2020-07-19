# Lecture 10

### Nginx
1. More info about it next week
2. `sudo amazon-linux-extras install nginx1.12`
3. run `sudo nginx` to start nginx server, then go to browser
4. Modify `/etc/nginx/nginx.conf`
   1. Need to use `sudo vim`
```
    location / {
        proxy_pass http://127.0.0.1:5000;
    }
}
```
- 
    - `127.0.0.1` is the default `localhost` IP
    - `proxy_pass` maps location `/` to `http://127.0.0.1:5000/`
4. then run `sudo nginx -s reload`
5. then run `flask run`

## Open remote files in VSCode
- install `Remote-ssh` extension
- click bottom left, and add `ec2-user@<>`



