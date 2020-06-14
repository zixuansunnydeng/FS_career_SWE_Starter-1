# **Lecture 1**

## **Install VSCode and Flutter**

### **VSCode**
- Go to https://code.visualstudio.com/ to download Vscode
- Then open VSCode and click here, you should see extension search bar
  - <img src="./vscode.png">
- Install Extensions
  - Dart
  - Flutter
  - Awesome Flutter Snippets
  - Flutter Widget Snippets
  - Remote-ssh
  - Others
    - TabNine
    - Bracket Pair Colorizer
    - GitLens
    - One Dart Pro
    - Vim & Relative Line Numbers (if you are into Vim)
  
### **Flutter**
- You don't have to look at my 'Steps breakdown', simply following the instructions in the links should work.
  - **It is important to practice your ability to install any tool as a Software Engineer!**
- **Mac**: https://flutter.dev/docs/get-started/install/macos
  - Steps breakdown:
    - Download zip file and extract
    - Open terminal run ``export PATH="$PATH:`pwd`/flutter/bin"`` to update flutter path
      - `pwd` is a command you can use to display the current directory
        - e.g. If you extracted zip under `Desktop`, then it should be `/<some directory>/Desktop`
    - Run `which flutter`
      - You should see the path gets printed out, if not, then there's something wrong you should try exporting the correct path
      - <img src="./which_flutter.png">
- **Windows**: https://flutter.dev/docs/get-started/install/windows
  - Steps Breakdown:
    - Download zip file and extract
    - Update your path following this instruction
      - <img src="./windows.png">
      - If you are not sure what environment variables look like, it should look like this
        - <img src="./win_env_var.jpg" height=300>
    - Open CMD and start type `where flutter` or `which flutter` depending on your Windows version. (Or just see if `flutter` command works)

### **Android Studio Simulator**
- Install Android Studio 
  - https://developer.android.com/studio
  - Open installer, click through `next` to start installing the packages 
    - For this step just click `do not import settings`
      - <img src="./studio_setting.png">
- After you successfully installed, you should see this
  - <img src="./studio.png" height=300>
- Configure Android Simulator
  - Click `Configue` => `AVD Manager` => `Create virtual device`
    - Click through and install R
      - <img src="./download_r.png" height=300>
  - After you are done, click `Configue` => `AVD Manager`
    - You should see this and click play button to start the simulator
      - <img src="./start_simulator.png">

### **Create your starter project**
- Open Android simulator
  - Click play button
- On terminal (MAC) or CMD (Windows)
  - run `flutter create starter_app`
    - You should see <img src="./all_done.png">
  - Do `cd starter_app`
  - Do `flutter run`
    - Wait for a bit for it to run
- You should be able to see the starter app to show up like this
 
<img src="./starter_app.png" height=300>

## **Dart Programming Language (15 minutes)**
From wiki, Dart is an **object-oriented**, **class-based,** **garbage-collected** language with C-style syntax.

### **Basic usage**

```dart
void main() {
    print('Hello, World!')
}
```
- What is `main` function?
  - ___
  - **Note**:

**Variable Definition**
- Common types: 
  - ___
- `var`:
- `dynamic`:
- `const`:
- `final`:
  - similar to `Java`'s `final`
  - compile-time vs. run-time?
- array:
- **Note:** initial value of every variable is ___ , unlike C/C++

**Function call**
```dart
void myName() {
  print('Cody');
}

void anyName(String name) {
  print(name);
}
```
**Passing function as a parameter**
```dart
String iChangeName(String name) {
  return name + 'ly';
}
void anyNameWithChange(String name, change) {
  var newName = change(name);
  print(newName);
}
```

**If condition**
```dart
bool a = false;
if (a) {
    a = true;
}
else {
    a = false;
}
OR
a = a ? false : true //ternary operator
```

**For loop**
```dart
int a = 5;
for (var i = 0; i < a; i++) {
  print('Hello $i');
}
```

### **Object-oriented with Dart**

**Class Definition**
```dart
class Car {
  String identifier;
  String make;
  String model;
  int maxSeats;
  
  // Constructor
  Car(identifier, make, model, maxSeats) {
    this.identifier = identifier;
    this.make = make;
    this.model = model;
    this.maxSeats = maxSeats;
  }
}

Car car = Car("bmw", "x5", 5);
print(car.make);
print(car.model);
print(car.maxSeats);
```
- Would `Car car = Car()` work? (default constructor)

**Member method**
```dart
class Car {
  String identifier;
  String make;
  String model;
  int maxSeats;

  Car(identifier, make, model, maxSeats) {
    this.identifier = identifier;
    this.make = make;
    this.model = model;
    this.maxSeats = maxSeats;
  }

  String fullModel() {
    return make + model
  }
}

Car car = Car('abc', "bmw", "x5", 5);
print(car.fullModel());
```

**Inheritance (is-a)**
```dart
class SUV extends Car {
  SUV(identifier, make, model, maxSeats): super(identifier, make, model, maxSeats);
  @override 
  String fullModel() {
    return "SUV:" + make + model;
  }
}
```

**Composition (has-a)**
```dart
class SUV {
  final Car car;
  SUV(Car car) {
    this.car = car;
  }
  @override 
  String fullModel() {
    return "SUV:" + make + model;
  }
}
```

- `Inheritance` vs. `Composition`?

**Polymorphism**: ___
```
SUV suv = SUV('abc', "bmw", "x5", 5);
Car car = Car('abc', "bmw", "x5", 5);
print(car.fullModel());
print(suv.fullModel());
```

**Abstract Class/Interface**: ___
```dart
abstract class Vehicle {
  String identifier;
  String make;
  String model;
  int maxSeats;
  
  String fullModel();
}

class Car extends Vehicle {

  Car(identifier, make, model, maxSeats) {
    this.identifier = identifier;
    this.make = make;
    this.model = model;
    this.maxSeats = maxSeats;
  }
  
  String fullModel() {
    return make + model;
  }
}
```

___

## **UI Component (30 minutes)**

### **Beginner project**

The starter project is essentially an app that you can increment the number on the center.

<img src="./starter_app.png" height=300>

```dart
import 'package:flutter/material.dart';
```
`Material.dart` is the library for Material Design
- Defines the major UI regions, components
  - Same default designs as Android
- `cupertino.dart` if you are interested in native iOS component (show more later)


### **Widgets**

```dart
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
```
- `StatelessWidget`: ___
  - All variables should be marked as ___
    - why?
  - **Note:**: you can still mutate variables, but there will be warning that you should change it to stateful widget
- `build` is where the code executes and build the input.
  - `BuildContext` contains context info regarding to this build (see more in the future)
- `MaterialApp`: Material design of the app
  - `CupertinoApp` + `CupertinoNavigationBar` to create iOS like style
- **Note**: notice there's explicit parameter when initialize a widget, unlike function or objects
---
```dart
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
```
- `StatefulWidget`: ___
  - Uses method `setState` to modify the variable (try without `setState`)
    ```dart
    int _counter = 0;

    void _incrementCounter() {
      setState(() {
        _counter++;
      });
    }
    ```
- `final` keyword: ___
  - `final` vs `const`
- Why does the function begin with `_`?

```dart
return Scaffold(
  appBar: AppBar(
    title: Text(widget.title),
  ),
  body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'You have pushed the button this many times:',
        ),
        Text(
          '$_counter',
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    ),
  ),
```
- `AppBar`: the bar on top
  - Also called `NavigationBar` in iOS terms
  - `Text`: shows the text
- `Center`:
- `Column`:
  - `mainAxisAlignment`:
    - `MainAxisAlignment.center`
    - `MainAxisAlignment.start`
    - `MainAxisAlignment.end`
  - `Row`:
  - `Stack`:
- `Theme.of(context)`: get information defined within the context

```dart
floatingActionButton: FloatingActionButton(
  onPressed: _incrementCounter,
  tooltip: 'Increment',
  child: Icon(Icons.add),
), 
```
- `FloatingActionButton`
  - `onPressed`:
  - `tooltip`: description if you do a long press
  - `child`:

---

### **Hot reload**

There are two ways to hot reload
- Save the file (command/ctrl + s)
  - It is also recommended to enable auto save in VSCode
    - Settings => 'Auto Save' => 'After delay'
- Click the yellow bolt button

Restart
- Click the green circular arrow

---

## **Task for you** (30 minutes)

1. Create a private function `_decrement()` that decrements the value by 1, and modify the floatingActionButton to do crement instead with icon `-` (I'll go over this)
2. Recreate the `+` button on bottom left
   1. **hint**: Try with `Stack` and `Align` (do some google search on this)
   2. Put `Stack` of widgets inside `floatingActionButton`
3. Pop up an `Alert` whenever the number hits 0 or hits 10, tells the user it cannot decrement after 0, nor cannot increment after reaches 10.
4. Try with other Button UI and take a look at the difference
     - `MaterialButton`
       - No default background, rectangular background
     - `IconButton`
       - circular default shape, no default background 
     - `FlatButton`
       - Similar to MaterialButton
     - `RaisedButton`
       - Materistic shape, with shadow
