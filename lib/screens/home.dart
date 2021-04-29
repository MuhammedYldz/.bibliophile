import 'dart:html';
import 'package:bibliophile/screens/DisplayBook.dart';
import 'package:bibliophile/screens/Profile.dart';
import 'package:bibliophile/screens/sign_in.dart';
import 'package:bibliophile/screens/ReadingBooks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/painting/image_provider.dart';

class home extends StatefulWidget {

  @override
  _homeState createState() => _homeState();
}

var bookData=[];
var userInfo=[];


class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {

    userInfo=ModalRoute.of(context).settings.arguments;

    bookData.add('Reading');
    bookData.add(0);
    return Scaffold(
      appBar: AppBar(

        elevation: 0.0,
        title: Text('Home Screen'),

      ),
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(child: Text('Page\'s'),
                decoration: BoxDecoration(color: Colors.blue),),
              ListTile(title: Text('Reading Books'), onTap: () {
                Navigator.pushNamed(context, '/ReadingBooks');
              },),
              ListTile(title: Text('Readed Books'), onTap: () {
                Navigator.pushNamed(context, '/ReadedBooks');
              },),
              ListTile(title: Text('To Read Books'), onTap: () {
                Navigator.pushNamed(context, '/ToReadBooks');
              },),
              ListTile(title: Text('About'), onTap: () {
                Navigator.pushNamed(context, '/About');
              },),
              ListTile(title: Text('Profile'), onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder:
                      (context){return Profile();},
                    settings: RouteSettings(
                        arguments: userInfo
                    ),
                  ),
                );
              },),
            ],
          )
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              Color(0xFF73AEF5),
              Color(0xFF61A4F1),
              Color(0xFF478DE0),
              Color(0xFF398AE5),
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
        ),

        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Text(''),

            ListOfBooks(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, '/AddBook')},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget ListOfBooks() {
    return Material(
      elevation: 14.0,
      color: Colors.blueAccent,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Text('Reading Books',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                    fontSize: 22
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/ReadingBooks');
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: booksListView('Reading'),
          ),

          Padding(
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Text('Readed Books', style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                  fontSize: 22),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/ReadedBooks');
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: booksListView('Readed'),
          ),


          Padding(
            padding: EdgeInsets.all(8.0),

            child: GestureDetector(
              child: Text('To Read Books', style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                  fontSize: 22),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/ToReadBooks');
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: booksListView('ToRead'),

          ),
        ],
      ),
    );
  }

  Widget booksListView(String listName) {
    return Container(
        height: 160.0,

        child: ListView(
          scrollDirection: Axis.horizontal,

          children: <Widget>[

            bookSection(
                'https://www.thebookdesigner.com/wp-content/uploads/2018/11/The-book-of-chaos.jpg',
                'name', 'author', 0, listName),
            SizedBox(
              width: 20.0,
            ),
            bookSection(
                'https://www.thebookdesigner.com/wp-content/uploads/2018/11/The-book-of-chaos.jpg',
                'name', 'author', 1, listName),
            SizedBox(
              width: 20.0,
            ),
            bookSection(
                'https://www.thebookdesigner.com/wp-content/uploads/2018/11/The-book-of-chaos.jpg',
                'name', 'author', 2, listName),
            SizedBox(
              width: 20.0,
            ),
            bookSection(
                'https://www.thebookdesigner.com/wp-content/uploads/2018/11/The-book-of-chaos.jpg',
                'name', 'author', 3, listName),
            SizedBox(
              width: 20.0,
            ),
            bookSection(
                'https://www.thebookdesigner.com/wp-content/uploads/2018/11/The-book-of-chaos.jpg',
                'name', 'author', 4, listName),
            SizedBox(
              width: 20.0,
            ),

            bookSection(
                'https://www.thebookdesigner.com/wp-content/uploads/2018/11/The-book-of-chaos.jpg',
                'name', 'author', 5, listName),
          ],
        ));
  }

  void SetBookData(int bookIndex, String listType) {
    bookData[0] = listType;
    bookData[1] = bookIndex;
  }

  Widget bookSection(String imageVal, String bookName, String author,
      int bookIndex, String listType) {
    return Column(

      children: <Widget>[
        Container(
          height: 100.0,
          width: 100.0,
          decoration: new BoxDecoration(

            image: DecorationImage(

              image: new NetworkImage(imageVal),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        new GestureDetector(
          onTap: () =>
          {SetBookData(bookIndex, listType), Navigator.push(
            context,
            MaterialPageRoute(builder:
                (context) {return DisplayBook();},
              settings: RouteSettings(
                  arguments: bookData
              ),
            ),
          )
          },

          child: Text(
            listType == 'Reading' ? readingbooksData[bookIndex][bookName] :
            listType == 'Readed' ? readedbooksData[bookIndex][bookName] :
            toreadbooksData[bookIndex][bookName],

            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16.0),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(

          children: <Widget>[
          Text(
            listType == 'Reading' ? readingbooksData[bookIndex]['author'] :
            listType == 'Readed' ? readedbooksData[bookIndex]['author'] :
            toreadbooksData[bookIndex]['author'],
            style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold,),
          ),
          Icon(Icons.star, size: 10.0,),
        ],)

      ],
    );
  }

  Widget labelContainer(String labelVal) {
    return Container(
      height: 30.0,
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            labelVal,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          Text(
            'MORE',

            style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
          ),
        ],
      ),
    );
  }


  var readingbooksData = [


      {
        'name': 'Kararı Ben Veririm',
        'author': 'Esra Ezmeci',
        'page': '216'
      },
      {
        'name': 'Kitap 2',
        'author': 'Esra Ezmeci',
        'page': '216'
      },
      {
        'name': 'Kitap 3',
        'author': 'Esra Ezmeci',
        'page': '216'
      },
      {
        'name': 'Kitap 4',
        'author': 'Esra Ezmeci',
        'page': '216'
      },
      {
        'name': 'Kitap 4',
        'author': 'Esra Ezmeci',
        'page': '216'
      },
      {
        'name': 'Kitap 4',
        'author': 'Esra Ezmeci',
        'page': '216'
      },
      {
        'name': 'Kitap 4',
        'author': 'Esra Ezmeci',
        'page': '216'
      }

  ];
  var toreadbooksData = [

      {
        'name': 'Kararı Kim Versin',
        'author': 'Esra Ezmeci',
        'page': '216'
      },
      {
        'name': 'Kitap 2',
        'author': 'Esra Ezmeci',
        'page': '216'
      },
      {
        'name': 'Kitap 3',
        'author': 'Esra Ezmeci',
        'page': '216'
      },
      {
        'name': 'Kitap 4',
        'author': 'Esra Ezmeci',
        'page': '216'
      },
      {
        'name': 'Kitap 4',
        'author': 'Esra Ezmeci',
        'page': '216'
      },
      {
        'name': 'Kitap 4',
        'author': 'Esra Ezmeci',
        'page': '216'
      },
      {
        'name': 'Kitap 4',
        'author': 'Esra Ezmeci',
        'page': '216'
      }

  ];
  var readedbooksData = [

      {
        'name': 'Kararı sen Verrrrrrrrrrrr',
        'author': 'Esra Ezmeci',
        'page': '216'
      },
      {
        'name': 'Kitap 2',
        'author': 'Kitap 2 yazarı',
        'page': '216'
      },
      {
        'name': 'Kitap 3',
        'author': 'Esra Ezmeci',
        'page': '216'
      },
      {
        'name': 'Kitap 4',
        'author': 'Esra Ezmeci',
        'page': '216'
      },
      {
        'name': 'Kitap 4',
        'author': 'Esra Ezmeci',
        'page': '216'
      },
      {
        'name': 'Kitap 4',
        'author': 'Esra Ezmeci',
        'page': '216'
      },
      {
        'name': 'Kitap 4',
        'author': 'Esra Ezmeci',
        'page': '216'
      }

  ];
}