# **Lecture 4**

## Table of Contents
1. Git Commands
2. JSON
3. Homework

---
## **1. Git/Github**

- version control
- It is useful to have a GitHub account

### **Most Used Commands**
- `git init`: make a folder as a git repository
- `git status`: output current status of your git repository
  - is it up to date
  - any modified files
- `git add`: add any modified/untracked file
- `git clone`: clone a repository to local
- `git commit -m "MESSAGE"`: make changes to repository
- `git push origin <BRANCH>`:
- `git checkout -b <BRANCH>`:
- `git log`: view your history commits
- https://help.github.com/en/github/importing-your-projects-to-github/adding-an-existing-project-to-github-using-the-command-line

### **Pull Request (PR)**
- Allow others to view the changes you are going to make to the code base
- `git checkout -b <NEW BRANCH>`: create a new branch
- `git add -A`: add modified files to the new branch
  - `-A`: add all changed files
- `git commit -m 'message'`
- `git push origin <NEW BRANCH>`
  - You may need to setup `personal access token` first

---
## **2. Get data from the Internet**
- We are generating data locally right now
- In reality, we should be getting restaurant data from somewhere else
  - e.g. server/database

### **Json**
- Common data type for Internet Object
- From Wikipedia:
  - Javascript Object Notion
  - Data interchange format
  - Uses human-readable text to store and transmit data
  - Consist of `key-value pairs` and `array` data types
    - `key-value pairs`: like dictionary
- Json is not a programming language
- Example
```json
{
  "firstName": "John",
  "lastName": "Smith",
  "isAlive": true,
  "age": 27,
  "address": {
    "streetAddress": "21 2nd Street",
    "city": "New York",
    "state": "NY",
    "postalCode": "10021-3100"
  },
  "phoneNumbers": [
    {
      "type": "home",
      "number": "212 555-1234"
    },
    {
      "type": "office",
      "number": "646 555-4567"
    }
  ],

  "children": [],
  "spouse": null
}
```
- why `json`?
  - commonly used with http request
  - `http`: application protocol used between web clients and web servers
    - client: e.g. web frontend, mobile frontend
    - `protocol`: set of rules when doing communication
  - part of `tcp/ip` family
    - `http` sits on `application layer` of `tcp/ip`
  - `json` is the most common serialized type
- `json` vs `xml`?
  - `xml`: internet object
  - `json` is more human readable
- `deserialization`: convert json type into a specific language type
- `serialization`: convert specific language type into a common type

### **Demo `Restaurant.json`**
- `Future`: object from asynchronous operations
  - why asynchronous: to allow parallel executions
  - so that the app can be faster
- `async`: keyword to specify a function being asynchronous
  - `initState` cannot be asynchronous
- `await`: wait for an asynchronous function to finish
- `whenComplete`: a callback function, so that we can do something when async function is complete
---
## **3. Short task for you**
1. Create a json file named `categories.json`
2. Replace the hard coded categories by loading this json file
