# Lecture 6

## **Finish Task**
1. Create an account in yelp
2. Use yelp api to load 5 restaurants info in each of `American`
3. Deserialize all restaurants as `Restaurant` Objects

## **Set up backend API with Python and Flask**

### Client-server model
- `Client`: web front-end, mobile frontend. Sends request to server
- `server`: server receves requests from client and sends back response
- many clients can request info from the server at the same time
- Pros:
  - separate the logic from client and server
- Cons:
  - server can become overloaded
<img src="./client_server.png" height=250>


### **Python**
- Python is probably the most common language right now
- `Dynamically typed` and `garbage-collected`
  - `Dynamically typed`: type is not required when programming, it can determine the type on run-time
  - `garbage-collected`: handles memory deallocation by itself
    - compare to `C` `C++`, you no longer need to write `free` keyword by yourself
    - automatically frees variable/object that have no reference count
- Install `Python3` from https://www.python.org/downloads/
  - You might need to setup PATH in order to run

### Virtual Environment
- `Virtual Environment`: creates a development environment thats independent of your system's libraries
  - Why? 
  - For example, if you have another app running on different versions, encounters problem
- `venv`
    ```
    $ mkdir flask_api
    $ cd flask_api
    $ python3 -m venv venv
    (OR on windows) py -3 -m venv venv
    ```
- Python3 has built-in `venv`, but Python2 doesn't

### **Flask**
- Flask is a `micro web framework` written in python
  - `micro`: does not require particular tools or libraries
- `WSGI application`: client side WSGI interface for WSGI server to connect
  - `WSGI - Web Server Gateway Interface`: standard way to run Python applications
  - `WSGI Server` (more later)
- https://flask.palletsprojects.com/en/1.1.x/installation/
- Activate virtual environment by
  - Mac: `source venv/bin/activate'
  - Windows: `venv/Script/activate'
    - Note: don't do it inside git cmd, use default cmd
- After activate virtual env, install flask by `pip install flask`

### **Quick Start**
- https://flask.palletsprojects.com/en/1.1.x/quickstart/
- Create a new file named `app.py` and add the following to the file
```python
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'
```
- Then run

Mac
```bash
$ export FLASK_APP=app.py
$ flask run
  * Running on http://127.0.0.1:5000/
```

Windows
```bash
set FLASK_APP=app.py
```
- Now open browser and open `http://127.0.0.1:5000/`, you should see hello world
  - development server

**Breakdown**
- `app=Flask(__name__)`
- `@app.route('/`)
  - `@` is the `decorator` syntax in python
    - `decorator`: decorate a function to another function
    - `hello_world()` is decorated to `app.route('/')`
  - It means that whenever the client reaches `{root_endpoint}/`, `hello_world()` is called and returned to the client

So what happens if we do
```python
@app.route('test/')
def test():
    return 'test'
```

### HTTP method
```python
@app.route('/getRes', methods=['GET'])
def getRes():
    return ['Steven', 'Good Restaurant']
```
- But this won't work. Why?
  - because we are returning a list, which is not a valid return type
- Can we use json? Why? 
  - json can be converted into a string when passing into the network
- `json serialization`
- `from flask import jsonify`

### **Task for you**
1. Now copy content from `resturant.json` to this API

