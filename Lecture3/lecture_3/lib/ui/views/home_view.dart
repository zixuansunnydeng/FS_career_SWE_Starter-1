import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lecture_3/core/model/restaurant.dart';

class HomeView extends StatelessWidget {
  static List<String> categories = ['American', 'French', 'Dessert', 'Bar'];
  static List<String> categoryImgs = [
    'Burger.png',
    'Beverage.png',
    'Dessert.png',
    'Cocktails.png'
  ];
  static Restaurant res = Restaurant("Steve's Smoke House", '\$\$', 'Steak',
      'American', 4.5, 'assets/res1.png');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Good morning, Annie',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: SizedBox()),
                  CircleAvatar(
                    child: Image.asset('assets/Profile.png'),
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Colors.white,
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.search),
                          Text('What would you like to eat?'),
                        ],
                      ),
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
            ],
          ),
        ),
      ),
    );
  }
}

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
          ButtonTheme(
            minWidth: 45,
            height: 45,
            child: RaisedButton(
              child: Image.asset('assets/$categoryImg'),
              onPressed: () {},
              color: Colors.white,
            ),
          ),
          SizedBox(height: 2),
          Text(categoryName, style: TextStyle(fontSize: 10)),
        ],
      ),
    );
  }
}

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
              ),
            )
          ],
        ),
      ),
    );
  }
}
