import 'package:first_example/pages/first_page/first_page.dart';
import 'package:flutter/material.dart';

import 'pages/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Hello world';

    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const MyHomePage(title: title),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const FirstPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
    );
  }
}


