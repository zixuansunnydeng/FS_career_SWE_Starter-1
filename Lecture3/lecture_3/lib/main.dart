import 'package:flutter/material.dart';
import 'package:lecture_3/ui/views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   textTheme: GoogleFonts.montserratTextTheme(
      //     Theme.of(context).textTheme,
      //   )
      // ),
      home: HomeView(),
    );
  }
}


