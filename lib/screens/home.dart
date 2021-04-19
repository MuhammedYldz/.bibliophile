import 'dart:html';

import 'package:bibliophile/screens/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    var data = [];
    data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(

        elevation: 0.0,
        title:Text('Home Screen'),

          leading: IconButton(
            padding: EdgeInsets.only(left: 30.0),
            onPressed: () => print('Menu'),
              icon: Icon(Icons.menu),
                iconSize: 30.0,
                color: Colors.white,
          ),
        ),

        body: Container(
          color: Colors.blueGrey,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Text(
                data[0]+' '+data[1]+' '+data[2]
              ),
              SizedBox(
                height: 150,
              ),
              ListOfBooks(),
            ],
          ),
        ),

    );


  }
  Widget ListOfBooks(){
    return Material(
      color: Colors.blue,
      elevation: 14.0,
      shadowColor: Colors.white,
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(8.0),
            child: labelContainer('Reading'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: booksListView(),
          ),
        ],
      ),
    );
  }
}

Widget booksListView(){
  return Container(
      height: 160.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          imageSection(
              'https://lh3.googleusercontent.com/48wwD4kfFSStoxwuwCIu6RdM2IeZmZKfb1ZeQkga0qEf1JKsiD-hK3Qf8qvxHL09lQ=s180-rw',
              'Amazon Kindle','4.2'),
          SizedBox(
            width: 20.0,
          ),
          imageSection(
              'https://lh3.googleusercontent.com/7uRfJe2KkpKxZuMvY4OjhIq-TJrMeHgWYQt0H7LHZl4WNDAYjI6FFrLSsLhj2g8cqKr5=s180-rw',
              'Audible','4.5'),
          SizedBox(
            width: 20.0,
          ),
          imageSection(
              'https://lh3.googleusercontent.com/d6TTnyRybU8B2naK8a0y1_u8ufjtK5V-mizS6o1tCx0U1aYPX9nJzcq9rSm5W2VVzBw=s180-rw',
              'Skype','4.1'),
          SizedBox(
            width: 20.0,
          ),
          imageSection(
              'https://lh3.ggpht.com/-wROmWQVYTcjs3G6H0lYkBK2nPGYsY75Ik2IXTmOO2Oo0SMgbDtnF0eqz-BRR1hRQg=s180-rw',
              'Google Docs','4.4'),
          SizedBox(
            width: 20.0,
          ),
          imageSection(
              'https://lh3.googleusercontent.com/S3kGpXqfWleVJuCSH-nFuoz3Ey7se8pnwSe2OP9pbm2e-DHRlNdlmM6njhsUyV4bmE8=s180-rw',
              'Polaris','4.3'),
          SizedBox(
            width: 20.0,
          ),
          imageSection(
              'https://lh3.googleusercontent.com/uI7mYOHs-xu-3oclPekf0Keaubhc_h_Q5wq9YdupUR1PzOGge5zV_CWnOBNAs45pDM7I=s180-rw',
              'OfficeSuite','4.3'),
        ],
      ));
}

Widget imageSection(String imageVal, String appVal,String rateVal) {
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
      Text(
        appVal,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
      SizedBox(
        height: 10.0,
      ),
      Row(children: <Widget>[
        Text(
          rateVal,
          style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold,),
        ),
        Icon(Icons.star,size: 10.0,),
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
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
        ),
        Text(
          'MORE',
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),
        ),
      ],
    ),
  );
}
