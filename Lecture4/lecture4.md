# **Lecture 4**

## **Tasks from lecture3**
1. Setup custom font
   1. Add google font to `pubspec.yaml`
   2. Let it install
   3. Import `google_font.dart` to `main.dart`
   4. Set `montserratTextTheme` as the default text theme
2. Setup asset path in `pubspec.yaml` (I'll show you this)
   1. under `flutter:` inside `pubspec.yaml`
   2. uncomment `assets:`
3. Fill out info inside search bar
4. Create the profile image
   1. **hint**: google at `CircularAvatar`
5. Fix the size of category buttons using `buttonTheme`
6. Fix padding inside resCard
7. Try create a folder under `ui/`, name as `subview`, and then create a file named `res_card.dart`, then move widget `ResCard` to that file
8. Create a list of Restaurant, and create a listview from that list of restaurant

## **Git/Github**
- version control

### **Create a Github account**

### **Most Used Commands**
- `git init`: make a folder as a git repository
- `git status`: output current status of your git reposity
  - is it up to date
  - any modified files
- `git add`: add any mofied/untrackd file
- `git clone`: clone a repository to local
- `git commit -m "MESSAGE"`: make changes to repository
- `git push origin <BRANCH>`:
- `git checkout -b <BRANCH>`:
- `git log`: view your history commits
- https://help.github.com/en/github/importing-your-projects-to-github/adding-an-existing-project-to-github-using-the-command-line

### **Pull Request (PR)**
- Allow others to view the changes you are going to make to the code base
- `git checkout -b <NEW BRANCH>`: create a new branch
- `git add -A`: add modified fiels to the new branch
  - `-A`: add all changed files
- `git commit -m 'message'`
- `git push origin <NEW BRANCH>`
  - You may need to setup `personal access token` first

## **Get data from the Internet**
- We are generating data locally right now
- In reality, we should be getting restaurant data from somewhere else
  - e.g. server/database

### **Json**
- Common data type for Internet Object
- From Wikipedia:
  - Javascript Object Notion
  - Data interchange format
  - Uses human-readable text to store and trasmit data
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
  - `json` is more human readble
- `deserialization`: convert json type into a specific language type
- `serialization`: convert specific language type into a common type

### **Demo `Restaurant.json`**
- `Future`: object from asynchronous operations
  - why asynchronous: to allow parallel executions
  - so that the app can be faster
- `async`: keyword to specify a functio being asychrnoous
  - `initState` cannot be asychronous
- `await`: wait for an asychronous function to finish
- `whenComplete`: a callback function, so that we can do something when async function is complete

### **Short task for you**
1. Create a json file named `categories.json`
2. Replace the hard coded categories by loading this json file
