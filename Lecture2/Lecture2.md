# **Lecture 2**

## Table of Contents
1. Flutter Beginner App Breakdown
2. Homework

## **Flutter App Breakdown**

In this demo, we will go through starter_app's main.dart file to demonstrate the basic parts of a flutter app. The file path is `[app_name]/lib/main.dart`.

The starter project is essentially an app that you can increment the number on the center.

<img src="./starter_app.png" height=300>

### **1. Material.dart**
```dart
// line 1
import 'package:flutter/material.dart';
```
`Material.dart` is the library for Material Design
- Defines the major UI regions, components
  - https://material.io/components
  - Same default designs as Android
- `cupertino.dart` if you are interested in native iOS component


### **2. Widgets**

- `Widget`: UI component that defines what the UI looks like. It could be an AppBar, a button, a textbox, etc
- `Widget Tree`: Think about the entire UI as a tree structure, where each node is a widget. Below is the widget tree for our starter_app:

```
MyApp
- MaterialApp (theme)
  - MyHomePage
    - Scaffold
      - AppBar
      - Center
        - Column
          - Text
          - Text (theme.of(context))
        - FloatingActionButton
          - Icon
  - Another page (theme.of(context))
```

### **3. runApp**
```dart
// line 3
void main() {
  runApp(MyApp()); // start the app with `MyApp` being the root of the widget tree
}
```

### **4. MyApp class**
```dart
// line 5
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
```
- `StatelessWidget`: cannot have mutable states
  - `state`: logic or internal of the app (e.g. value of its member variables)
  - All variables should in theory be marked as `final`
    - why? because `final` enforces variables to be only assigned once, so it follows the definition of `stateless Widget`
- `build`: return the UI representations of this widget
  - Called when the widget is firstly built or when the widget is reloaded
  - `BuildContext` contains context info regarding to a widget location
- `MaterialApp`: Material design of the app
  - `CupertinoApp` to create iOS like style
- `MaterialApp` is the child of `MyApp`

### **5. MyHomePage class**
```dart
// line 32
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
```
- `StatefulWidget`: opposite to StatelessWidget, it can have mutable state

### **6. _MyHomePageState class**
  ```dart
    // line 50
    class _MyHomePageState extends State<MyHomePage> {
      int _counter = 0;

      void _incrementCounter() {
        setState(() { // this function modifies state changes of MyHomePage class
          _counter++;
        });
      }
  ```

- Why does the function begin with `_`? `private variable`, `private method`
  - In flutter, there's no `private`, `protected` keywords
  - `private` is handles in library-level
    - example, it can be used int he same file, not in another file
  - Why do we have private functions/class
    - `Encapsulation`: data hiding, restrict access

### **7. Scaffold**

```dart
// line 82
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
  - `Text`: text widget
- `Center`: center child widget
- `Column`: display child widgets vertically
  - `mainAxisAlignment`: alignment on the main axis
    - in programming/graphics/computer vision: y=0 is at the top
    - main axis => y
    - `MainAxisAlignment.center`
    - `MainAxisAlignment.start`
    - `MainAxisAlignment.end`
  - `CrossAxisAlignment`: alignment on the cross axis
    - cross axis => x
  - What happens if I do `CrossAxisAlignment.start`?
    - the children with smaller width got shifted to the left hand side
  - `Row`: horizontal display
  - `Stack`: stack UI together
- `Theme.of(context)`: get theme information defined within the context

### **8. FloatingActionButton**
```dart
// line 119
floatingActionButton: FloatingActionButton(
  onPressed: _incrementCounter,
  tooltip: 'Increment',
  child: Icon(Icons.add),
),
```
- `FloatingActionButton`
  - `onPressed`
  - `tooltip`
  - `child`


### **9. Hot reload/restart**

Hot reload
 - It updates the UI states
- There are two ways to hot reload
  1. Save the file (command/ctrl + s)
     - It is also recommended to enable auto save in VSCode
      - Settings => 'Auto Save' => 'After delay'
  2. Click the yellow bolt button

Restart
- Will rebuild everything in the app. Use it when you changed the app structure, such as adding extra files
- To restart, click the green circular arrow


---

## **Task for you**

1. Create a private function `_decrement()` that decrements the value by 1, and modify the floatingActionButton to do crement instead with icon `-` (I'll go over this)
2. Recreate the `+` button on bottom left
   1. **hint**: Try with `Stack` and `Align` (do some google search on this)
   2. Put `Stack` of widgets inside `floatingActionButton`
3. Pop up an `Alert` whenever the number hits 0 or hits 10, tells the user it cannot decrement after 0, nor cannot increment after reaches 10.
   1. **hint**: look up function `showDialog`
4. Try with other Button UI and take a look at the difference
     - `MaterialButton`
     - `IconButton`
     - `FlatButton`
     - `RaisedButton`