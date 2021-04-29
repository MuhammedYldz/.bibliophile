//To do Display Book Info
//Book name, Author name, Page, if reading book Targeted Finish Time if readed book finished time,
//If its a Reading Book End Reading Book button, else start Read Button,Add To Read Button,
import 'package:bibliophile/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bibliophile/screens/Data.dart';
String bookName;
int bookIn;
String author;
String page;

String listType;
int bookIndex;
class DisplayBook extends StatefulWidget {

  @override
  _DisplayBookState createState() => _DisplayBookState();
}

void getBookInfo(){
  bookName = listType=='Reading' ? readingbooksData[bookIndex]['name']:
              listType=='Readed' ?  readedbooksData[bookIndex]['name']:
              toreadbooksData[bookIndex]['name'];
  author = listType=='Reading' ? readingbooksData[bookIndex]['author']:
            listType=='Readed' ?  readedbooksData[bookIndex]['author']:
            toreadbooksData[bookIndex]['author'];
  page = listType=='Reading' ? readingbooksData[bookIndex]['page']:
            listType=='Readed' ?  readedbooksData[bookIndex]['page']:
            toreadbooksData[bookIndex]['page'];
}
class _DisplayBookState extends State<DisplayBook> {


  @override
  Widget build(BuildContext context) {

    var bookData =[];

    bookData = ModalRoute.of(context).settings.arguments;
    listType = bookData[0];
    bookIndex = bookData[1];
    getBookInfo();

    return Scaffold(
      appBar: AppBar(
        elevation: .5,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){Navigator.popAndPushNamed(context, '/home');},
        ),
        title: Text('Book Display'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.create_rounded,color: Colors.white,),
            onPressed: (){},
          )
        ],
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF73AEF5),
                        Color(0xFF61A4F1),
                        Color(0xFF478DE0),
                        Color(0xFF398AE5),
                      ],
                      stops: [0.1, 0.4, 0.7, 0.9],
                    ),
                  ),
                ),
                Container(
                  height: 250,
                  width: double.infinity,

                  margin: EdgeInsets.all(7),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Text(bookName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:<Widget> [
                              Text('Name : '),
                              Text('Author :'),
                              Text('Page :'),
                            ],
                          ),
                          Column(
                            children:<Widget> [
                              Text(bookName),
                              Text(author),
                              Text(page),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: <Widget>[
                              Container(
                                height: 100.0,
                                width: 100.0,
                                decoration: new BoxDecoration(

                                  image: DecorationImage(

                                    image: new NetworkImage("https://www.thebookdesigner.com/wp-content/uploads/2018/11/The-book-of-chaos.jpg"),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              )

                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin : EdgeInsets.only(top :250),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      ElevatedButton(

                        onPressed: (){
                        CupertinoAlertDialog(
                          title: Text('Adding this Book to Reading List'),
                          content: Text('Do you accept'),
                          actions: [
                            CupertinoDialogAction(child: Text('No'),),
                            CupertinoDialogAction(child: Text('Yes'),),
                          ],
                        );
                        showCupertinoDialog(context: context, builder: (_)=>CupertinoAlertDialog(),barrierDismissible: false,);
                        },
                        child: Text('Start Read'),
                      ),
                      ElevatedButton(onPressed: (){}, child: Text('End Reading'),),
                      ElevatedButton(onPressed: (){}, child: Text('Add To Read'),)
                    ],
                  ),
                ),
              ],
            ),
        ),
      ),

    );
  }
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
    },


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
