import 'package:bibliophile/screens/home.dart';
import 'package:bibliophile/screens/ReadingBooks.dart';
import 'package:bibliophile/screens/ReadedBooks.dart';
import 'package:bibliophile/screens/ToReadBooks.dart';
import 'package:bibliophile/screens/About.dart';
import 'package:bibliophile/screens/DisplayBook.dart';
import 'package:bibliophile/screens/AddBook.dart';
import 'package:bibliophile/screens/Profile.dart';
import 'package:bibliophile/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:bibliophile/screens/sign_in.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bibliophile',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => sign_in(),
        '/sign_up': (context) => sign_up(),
        '/home' : (context) => home(),
        '/ReadingBooks': (context) => ReadingBooks(),
        '/ReadedBooks': (context) => ReadedBooks(),
        '/ToReadBooks': (context) => ToReadBooks(),
        '/DisplayBook': (context) => DisplayBook(),
        '/AddBook': (context) => AddBook(),
        '/About': (context) => About(),
        '/Profile': (context) => Profile(),
      },
    );
  }
}