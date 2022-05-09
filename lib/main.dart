import 'package:flutter/material.dart';
import 'package:gauge_packages/charts_flutter_package.dart';
import 'package:gauge_packages/gauges_package.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:    Scaffold(body: Gaugespackage(),)
    );
  }
}


