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

## Database
- `dynamoDB`: distributed No-SQL database
- Create a Restaurant Table in DynamoDB
- More concepts about it next week

## Using ORM
- `ORM`: Object-relational mapping
  - being able to write database commands using object-oriented programming
  - allows combining DB query and backend logic into one codebase
- `pynamodb`: a python ORM library for DynamoDB
- `pip3 install pynamodb`
```python
from pynamodb.models import Model
from pynamodb.attributes import UnicodeAttribute, NumberAttribute

class Restaurant(Model):
    class Meta:
        table_name = "Restaurant"
        region = 'us-east-1'
    
    resName = UnicodeAttribute(hash_key=True)
```
- Save yelp data by
```python
from restaurant import Restaurant
if __name__ == '__main__':
    data = yelp_data()
    res_data = data.json()['businesses']
    for res in res_data:
        resDB_data = Restaurant(
            resName=res['name'],
        )
        resDB_data.save()
```
- credential error?


## Setup AWS credentials
- `IAM`: Identity Access Management
  - Defines the privileges of users
    - Some maybe employees, some maybe DevOps Admins, maybe even customers
- Create a IAM role
- Create folder `~/.aws`, and create file named `credentials`
```
[default]
aws_access_key_id = <your_access_key_id>
aws_secret_access_key = <your_secret_access_key>
```

## Load data from DB
```python
@app.route("/getRes", methods=["GET"])
def getRes():
    res_data = [vars(res) for res in Restaurant.scan()]
    return jsonify(res_data)
```
- `scan()` returns everything row from the table 

## Tasks for you
1. Add more fields to `Restaurant`, such as 
```
priceRange
category1
category2
rating
image_url
```
2. In frontend, call this server's endpoint

