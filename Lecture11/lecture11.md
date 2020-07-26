# Lecture 11

## Relational Database
- `Database Schema`: organization of data
  - describes what's inside and the relationship between them
  - `Schema` defines `Tables`
- `Tables`: defines column keys
<img src="./table.jpg" height=200 width=400>
  - `Column`: value with the same type
  - `Row`: structured data in a table
- `Primary key`: uniquely identifies a column
  - `MySQL` and other relational database has auto increment id

## DynamoDB
- `dynamoDB`: distributed No-SQL database
  - `NoSQL`: non-relational database, does not require a fixed schemas, means can add or delete column on the fly
    - Or called `Document based` or `key-value pair`
```json
[
    {
      "employee_id": "001",
      "name": "Alex",
      "age": 20,
      "hobby": "tennis"
    },
    {
      "employee_id": "002",
      "name": "Jason",
      "age": 21,
    }
```
- Create a Restaurant Table in DynamoDB
- More concepts about it tomorrow

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
    city = UnicodeAttribute()
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
    1. Click Add User
    2. Click `progammtic access`
    3. Create a new group, give `AdministratorAccess`
    4. Ignore add tag
    5. Save AccessKey and SecretKey
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
