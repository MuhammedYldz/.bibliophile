import 'package:bibliophile/screens/home.dart';
import 'package:bibliophile/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:bibliophile/screens/sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      home: sign_in(),

    );
  }
}