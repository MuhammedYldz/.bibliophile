// List of To Read Book
import 'package:flutter/material.dart';
import 'package:bibliophile/screens/DisplayBook.dart';

class ToReadBooks extends StatefulWidget {
  @override
  _ToReadBooksState createState() => _ToReadBooksState();
}
var bookData=[];
class _ToReadBooksState extends State<ToReadBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Read Books'),
      ),
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(child: Text('Page\'s'),decoration: BoxDecoration(color: Colors.blue),),
              ListTile(title:Text('Home'),onTap: (){Navigator.pushNamed(context,'/home');},),
              ListTile(title:Text('Reading Books'),onTap: (){Navigator.pushNamed(context,'/ReadingBooks');},),
              ListTile(title:Text('Readed Books'),onTap: (){Navigator.pushNamed(context,'/ReadedBooks');},),
              ListTile(title:Text('About'),onTap: (){Navigator.pushNamed(context,'/About');},),
              ListTile(title:Text('Profile'),onTap: (){Navigator.pushNamed(context,'/Profile');},),
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
        child:Container(
          child: GestureDetector(
            child: ListView(

              padding: EdgeInsets.only(top:10,bottom: 10),
              scrollDirection: Axis.vertical,
              children: <Widget>[
                bookSection(
                    'https://www.thebookdesigner.com/wp-content/uploads/2018/11/The-book-of-chaos.jpg',
                    'name', 'author', 0, 'ToRead'),
                SizedBox(
                  width: 20.0,
                ),
                bookSection(
                    'https://www.thebookdesigner.com/wp-content/uploads/2018/11/The-book-of-chaos.jpg',
                    'name', 'author', 1, 'ToRead'),
                SizedBox(
                  width: 20.0,
                ),
                bookSection(
                    'https://www.thebookdesigner.com/wp-content/uploads/2018/11/The-book-of-chaos.jpg',
                    'name', 'author', 2, 'ToRead'),
                SizedBox(
                  width: 20.0,
                ),
                bookSection(
                    'https://www.thebookdesigner.com/wp-content/uploads/2018/11/The-book-of-chaos.jpg',
                    'name', 'author', 3, 'ToRead'),
                SizedBox(
                  width: 20.0,
                ),
                bookSection(
                    'https://www.thebookdesigner.com/wp-content/uploads/2018/11/The-book-of-chaos.jpg',
                    'name', 'author', 4, 'ToRead'),
                SizedBox(
                  width: 20.0,
                ),

                bookSection(
                    'https://www.thebookdesigner.com/wp-content/uploads/2018/11/The-book-of-chaos.jpg',
                    'name', 'author', 5, 'ToRead'),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, '/AddBook')},
        child: const Icon(Icons.add),
      ),
    );
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
          onTap: () => {SetBookData(bookIndex, listType),
            Navigator.push(context,
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
  void SetBookData(int bookIndex, String listType) {
    bookData[0] = listType;
    bookData[1] = bookIndex;
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
