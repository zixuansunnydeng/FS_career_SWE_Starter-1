import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lecture_3/core/model/restaurant.dart';

class DetailsView extends StatelessWidget {
  final Restaurant res;

  DetailsView({@required this.res});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO: add background Color to make it transparent
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: <Widget>[
          // TODO: add height and fit to make this image look better
          Image.network(res.resImage),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
            child: Row(
              children: <Widget>[
                Text(res.resName,
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(width: 5),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  minSize: double.minPositive,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                    size: 25,
                  ),
                  onPressed: () {},
                ),
                Expanded(child: SizedBox()),
                Text(
                  res.priceRange,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 4),
            child: Row(
              children: [
                Image.asset('assets/google_logo.jpg', height: 20, width: 20),
                SizedBox(width: 2),
                Text('${res.rating}'),
                SizedBox(width: 2),
                // TODO: (bonus) look into rating bar indicator to make it dynamic
                // https://pub.dev/packages/flutter_rating_bar
                Icon(Icons.star, size: 20),
                Icon(Icons.star, size: 20),
                Icon(Icons.star, size: 20),
                Icon(Icons.star, size: 20),
                Icon(Icons.star_half, size: 20),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
            // TODO: parse the address from yelp data and save to database
            // and then to display it
            child: Text('90 Eglinton East, Toronto, ABC EFG'),
          ),
          Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Popular Dishes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Container(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    FlatButton(
                        child: Image.network(
                          res.resImage,
                        ),
                        onPressed: () {}),
                    Text('Prime Ribs',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold))
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    FlatButton(
                        child: Image.network(res.resImage), onPressed: () {}),
                    Text(
                      'Teriyaki',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    FlatButton(
                      child: Image.network(res.resImage),
                      onPressed: () {},
                    ),
                    Text(
                      'Teriyaki',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () {},
              child:
                  Text('Book the table', style: TextStyle(color: Colors.white)),
              // TODO: Add rounded border to the button
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
