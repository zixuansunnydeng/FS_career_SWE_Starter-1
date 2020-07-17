# Lecture 9

### Vim Tutorial
My most used commands
- arrow vs `hjkl` as `up, down, up, right`
- use `esc` to go to insert mode, click any known keyword to go to type mode
    - e.g. `a`, `s`
- go to the end of the line: `$`
- go to the start of the line: `0`
- go to the next word: `w`
- go to the previous word: `b`
- find the next char: `f + {char}`
- delete entire line: `dd`
- delete the next word: `dw`
- go to particular line: `:{num}`
- go to beginning of the file: `gg`
- go to end of the file: `shirt+g`
- search and replace 
   - line 5 to line 12, replace a to b: `:5,12s/a/b/g`
    - search all: `%`
- combinations
  - delete 3 lines above? `d3k`
  - move to next 2 words? `w2`
  - go to the next 3 lines? `3j`

##Now follow me carefully

###  **Create a EC2 server**
1. Choose `us-east-1` as location
2. Create a AWS linux server
3. Free tier instance type
4. Configuration details: default
5. Storage: can increase it to up to 30GB
6. Security group add a description
7. launch
8. save the key pair, need this to ssh into the server

### Go inside the EC2 server
- `ssh`: Secured Shell, a network protocol that allows a secure way to control a remote computer over the Internet
  - default to TCP port 22
- For Windows users, you may need to install `PuttyGen` to convert `.pem` to `ppk`
  - https://www.ssh.com/ssh/putty/windows/puttygen
  - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html
- For Mac Users: `chmod 400 *.pem` to add permissions
  - `ssh -i *.pem ec2-user@ec2-<IP>.us-east-2.compute.amazonaws.com`

### Install tools and packages
1. `sudo yum update`
2. `sudo yum install python3`
    - What is `sudo`?
3. Create new folder
4. Create your virtual environment
5. Install libraries
6. Copy paste your flask file to here
7. Start your flask app
   1. `export FLASK_ENV=development`
   2. `export FLASK_APP=app`
8. In your browser, try with `<IP>` or `<IP>:5000`

### What happened? 
- No response
- We need to setup inbound access inside AWS
- `Security Group`: manage security access for AWS services
- Add `HTTP` type inbound
    - default to port 80
- What can we do next? We could possibly run flask on port 80
    - `flask run --port=80`
    - But we run into a problem
    - Any port < 1024 needs root user privilege (sudo)
    - But we are running on virtual environment?
- Solution: Proxy server

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

