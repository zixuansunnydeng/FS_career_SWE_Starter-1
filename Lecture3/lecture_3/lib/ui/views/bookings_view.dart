import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class BookingsView extends StatefulWidget {
  @override
  _BookingsViewState createState() => _BookingsViewState();
}

class _BookingsViewState extends State<BookingsView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loggedIn = false;

  Future<String> login(email, password) async {
    // Use your own server api, make a GET request on /getRes
    var endpoint = 'http://52.205.82.172/login';
    final params = {
      'email': email,
      'password': password,
    };
    var headers = {'Content-type': 'application/json'};
    var response =
        await post(endpoint, headers: headers, body: jsonEncode(params));
    var output = json.decode(response.body);
    print(output);
    return output;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Bookings"),
      ),
      body: loggedIn ? Container(child: Text("Logged in")) : Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'email',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'password',
              ),
            ),
            SizedBox(height: 16),
            RaisedButton(
              onPressed: () async {
                var result =
                    await login(emailController.text, passwordController.text);
                if (result == "Success") {
                  setState(() {
                    loggedIn = true;
                  });
                } else if (result == "Wrong Password") {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Wrong Password"),
                          content: Text("Please enter the correct password"),
                        );
                      });
                } else {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Invalid Email"),
                          content: Text("Please enter the correct email"),
                        );
                      });
                }
              },
              child: Text('Log In Now', style: TextStyle(color: Colors.white)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
