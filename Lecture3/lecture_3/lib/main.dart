import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lecture_3/core/model/user.dart';
import 'package:lecture_3/ui/views/bottom_navigation_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<User>(
      create: (_) => User(null, null, [], []),
      child: MaterialApp(
        theme: ThemeData(
            textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        )),
        home: BottomNavigationView(),
      ),
    );
  }
}
