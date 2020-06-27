# **Lecture 3**

## **Task from lecture 2**

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

## Unit Testing
- TDD: test-driven development
- Tests correctness of individual components of a codebase
`/test/widget_test.dart`
```dart
void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
```
- `findsOneWidget`: means one widget is found
- `findsNothing`: no widget is found given the condition

**Task**
- write a unit test for your decrement button

## **Course Project**

### **Git clone starter template repository**
- `git clone` entire repo

### **Go over starter code**

`main.dart`
```dart
return MaterialApp(
  home: HomeView(),
);
```

`home_view.dart`
```dart
static List<String> categories = ['American', 'French', 'Dessert', 'Bar'];
static List<String> categoryImgs = [
  'Burger.png',
  'Beverage.png',
  'Dessert.png',
  'Cocktails.png'
];
static Restaurant res = Restaurant("Steve's Smoke House", '\$\$', 'Steak',
    'American', 4.5, 'assets/res1.png');
```
- `static`: class-wide state and constants, not accesible to instances

```dart
SafeArea(
    child:
```
- `SafeArea`: displays widget outside of SafeArea

```dart
Text(
    'Good morning, Annie',
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
),
```
- `TextStyle`

```dart
Row(
    children: <Widget>[
      Expanded(
        child: RaisedButton(
          color: Colors.white,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      SizedBox(width: 5),
      ButtonTheme(
        minWidth: 20,
        child: FlatButton(
            child: Image.asset('assets/filter.png'),
            onPressed: () {}),
      ),
    ],
  ),
```
- `Expanded`: expand the widget to take on any remaining width/height
- `RoundedRectangleBorder`
- `ButtonTheme`
- `Image.asset` get image given specified path

```dart
Container(
  height: 80,
  child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return CategoryButton(
            categoryName: categories[index],
            categoryImg: categoryImgs[index]);
      }),
),
```
- `ListView.builder`: allow arbitrary length, and scrollable
- Why wrap around with a `Container`?
  - Because it's arbitray, inside a Column, need to know the underlying dimension

```dart
Align(
  alignment: Alignment.centerLeft,
  child: Text(
    'Popular Near You',
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  ),
),
SizedBox(height: 5),
Container(
  height: 200,
  child: ListView(
    scrollDirection: Axis.horizontal,
    children: <Widget>[
      ResCard(res: res),
      SizedBox(width: 10),
      ResCard(res: res),
    ],
  ),
)
```

```dart
class CategoryButton extends StatelessWidget {
  final String categoryName;
  final String categoryImg;

  CategoryButton({@required this.categoryName, @required this.categoryImg});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Image.asset('assets/$categoryImg'),
            onPressed: () {},
            color: Colors.white,
          ),
          SizedBox(height: 2),
          Text(categoryName, style: TextStyle(fontSize: 10)),
        ],
      ),
    );
  }
}
```
- what's `@required`
  - Default not required, adding it so that must be passed in
- Can someone help me walk through this widget?

```dart
class ResCard extends StatelessWidget {
  final Restaurant res;
  ResCard({@required this.res});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(res.resImage),
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 4, 0, 0),
              child: Text(
                res.resName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 4, 0, 0),
              child: Row(
                children: <Widget>[
                  Text(
                      '${res.priceRange} • ${res.cuisineType1} • ${res.cuisineType2}'),
                  Expanded(child: SizedBox()),
                  Text('1.9 km'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 4, 0, 0),
              child: Row(
                children: <Widget>[
                  Image.asset('assets/google_logo.jpg', height: 20, width: 20),
                  SizedBox(width: 2),
                  Text('4.5'),
                  SizedBox(width: 2),
                  Icon(Icons.star, size: 20),
                  Icon(Icons.star, size: 20),
                  Icon(Icons.star, size: 20),
                  Icon(Icons.star, size: 20),
                  Icon(Icons.star_half, size: 20),
                ],
```


### **Your Turn**
1. Setup custom font (I'll show you this)
   1. Add google font to `pubspec.yaml`
   2. Let it install
   3. Import `google_font.dart` to `main.dart`
   4. Set `montserratTextTheme` as the default text theme
2. Setup asset path in `pubspec.yaml` (I'll show you this)
   1. under `flutter:` inside `pubspec.yam`
   2. uncomment `assets:`
3. Fill out info inside search bar
4. Create the profile image
   1. **hint**: google at `CircularAvatar`
5. Fix the size of category buttons using `buttonTheme`
6. Fix padding inside resCard
7. Try create a folder under `ui/`, name as `subview`, and then create a file named `res_card.dart`, then move widget `ResCard` to that file
8. Create a list of Restaurant, and create a listview from that list of restaurant

## Git/Github

### **Most Used Commands**
- `git init`:
- `git clone`:
- `git commit -m "MESSAGE"`:
- `git remote add origin URL`: 
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
