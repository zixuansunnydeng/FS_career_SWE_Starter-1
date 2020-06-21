# **Lecture 2**

## **UI Component**

### **Beginner project**

The starter project is essentially an app that you can increment the number on the center.

<img src="./starter_app.png" height=300>

```dart
import 'package:flutter/material.dart';
```
`Material.dart` is the library for Material Design
- Defines the major UI regions, components
  - https://material.io/components
  - Same default designs as Android
- `cupertino.dart` if you are interested in native iOS component


### **Widgets**: UI components

- `Widget`: define what the UI looks like
- `Widget Tree`: Think about the entire UI as a tree structure, where each node is a widget

```dart
void main() {
  runApp(MyApp());
}
```
- `runApp`: start the app with `MyApp` being the root of the widget tree

```dart
class MyApp extends StatelessWidget {
  final int a;
  MyApp(int aa) {
    this.a = aa;
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
```
- `StatelessWidget`: does not require mutable states
  - `state`: logic or internal of the app (e.g. value of its member variables)
  - All variables should in theory be marked as `final`
    - why? because `final` enforces variables to be only assigned once, so it follows the definition of `stateless Widget`
- `build`: return the UI representations of this widget
  - Called when the widget is firstly built or when the widget is reloaded
  - `BuildContext` contains context info regarding to a widget location
- `MaterialApp`: Material design of the app
  - `CupertinoApp` to create iOS like style
- `MaterialApp` is the child of `MyApp`
---
```dart
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
```
- `StatefulWidget`: can have mutable state
  - Uses method `setState` to modify state changes (try without `setState`)
    ```dart
    int _counter = 0;

    void _incrementCounter() {
      setState(() {
        _counter++;
      });
    }
    ```
- Why does the function begin with `_`? `private variable`, `private method`
  - In flutter, there's no `private`, `protected` keywords
  - `private` is handles in library-level
    - example
  - Why do we have private functions/class
    - `Encapsulation`: data hiding, restrict access

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

```dart
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

`Widget Tree`
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

---

### **Hot reload/restart**

There are two ways to hot reload
- Save the file (command/ctrl + s)
  - It is also recommended to enable auto save in VSCode
    - Settings => 'Auto Save' => 'After delay'
- Click the yellow bolt button

Restart
- Click the green circular arrow

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