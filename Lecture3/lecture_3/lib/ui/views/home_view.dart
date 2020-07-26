import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:lecture_3/core/model/restaurant.dart';
import 'package:lecture_3/ui/views/subviews/res_card.dart';

class HomeView extends StatefulWidget {
  static List<String> categories = ['American', 'French', 'Dessert', 'Bar'];
  static List<String> categoryImgs = [
    'Burger.png',
    'Beverage.png',
    'Dessert.png',
    'Cocktails.png'
  ];
  static List<Restaurant> resList = [];

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    // load restaurant.json when start up
    loadRestaurant().whenComplete(() {
      setState(() {});
    });
  }

  Future<void> loadRestaurant() async {
    // Use your own server api, make a GET request on /getRes
    var endpoint = 'http://34.229.189.142/getRes';
    Response response = await get(endpoint);
    for (var jsonRes in json.decode(response.body)) {
      print(jsonRes);
      var res = Restaurant(jsonRes['name'], jsonRes['price'], jsonRes['categories'][0]['alias'],
          jsonRes['categories'][0]['title'], jsonRes['rating'], jsonRes['image_url']);
      HomeView.resList.add(res);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('build');
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
                    itemCount: HomeView.categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CategoryButton(
                          categoryName: HomeView.categories[index],
                          categoryImg: HomeView.categoryImgs[index]);
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
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: HomeView.resList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ResCard(res: HomeView.resList[index]);
                    }),
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
