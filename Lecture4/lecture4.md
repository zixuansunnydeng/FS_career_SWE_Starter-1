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

### **Create a Github account**

### **Most Used Commands**
- `git init`:
- `git clone`:
- `git commit -m "MESSAGE"`:
- `git push origin <BRANCH>`:
- `git checkout -b <BRANCH>`:
- `git log`:
- https://help.github.com/en/github/importing-your-projects-to-github/adding-an-existing-project-to-github-using-the-command-line

### **Pull Request**
- Allow others to view the changes you are going to make to the code base
- `git checkout -b <NEW BRANCH>`
- `git add -A`
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
  - `http`: application protocol used between web clients and web servers
    - `protocol`: __
  - part of `tcp/ip` family
    - `http` sits on `application layer` of `tcp/ip`
  - `json` is the most common serialized type
- `json` vs `xml`?
- `deserialization`: __
- `serialization`: __

### **Demo `Restaurant.json`**
- `Future`: __
- `async`: __
- `await`: __

### **Short task for you**
1. Create a json file named `categories.json`
2. Replace the hard coded categories by loading this json file
