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
    - **Note**: if you encounter any error, try `flutter doctor` to see what the issue is, you might need to
      - fix android license
      - reinstall Android SDK tool
- You should be able to see the starter app to show up like this
 
<img src="./starter_app.png" height=300>

## **Dart Programming Language**
From wiki, Dart is an **object-oriented**, **class-based,** **garbage-collected** language with C-style syntax.

### **Basic usage**

```dart
void main() {
    print('Hello, World!');
}
```
- What is `main` function?
  - Entrypoint of the run-time application
  - **Note**: Not necesarily the first to start, need to startup some run-time environment/lirbary (c/c++) 

**Variable Definition**
- Common types: 
  - int
  - double
  - String
  - ...
- `var`: a variable that's anble to change its value
- `dynamic`: change value and change type
- `const`: compile-time constant
- `final`: run-time constant, variable can only be assigned once
  - similar to `Java`'s `final`
  - compile-time vs. run-time?
  - compile-time: compile my codebase to an executable
  - runtime: running an instance of an executbale
- array: []
- **Note:** initial value of every variable is null , unlike C/C++
  - Stack: garbage value
  - globale variable/heap: `int` => 0

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
- A function can be passed in as a parameter

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
  - default constructor: constructor that has no arguments
  - Dart: removes default constructor when custom constructor is defined
  - (c++: default constructor is always ok to use, unless placed under private)

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
- `super`: calls parent's class's construct
- `override`: overrides parent's class's member method

**Composition (has-a)**
```dart
class SUV {
  Car car;
  SUV(Car car) {
    this.car = car;
  }

  String fullModel() {
    return "SUV:" + car.make + car.model;
  }
}
```

- `Inheritance` vs. `Composition`?
  - Inheriance: reuseable code
  - Composition: less dependency, allow better unit testing
  - In industry, people prefer Composition over Inheriance when given a choice

**Polymorphism**: same representations can have different meanings
```
SUV suv = SUV('abc', "bmw", "x5", 5);
Car car = Car('abc', "bmw", "x5", 5);
print(car.fullModel());
print(suv.fullModel());
```

**Abstract Class/Interface**: class that canno't be instantiated but can be inherited
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