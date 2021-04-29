//To do Add Book Info
//Book name, Author name, Page, if reading book Targeted Finish Time if readed book finished time,
//If its a 'Reading Book' start Reading Book button, or add 'Readed' Button, or Add 'To Read' Button,
import 'dart:html';
import 'package:bibliophile/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:bibliophile/utilities/constants.dart';
import 'package:flutter/services.dart';
class AddBook extends StatefulWidget {
  @override
  _AddBookState createState() => _AddBookState();
}
String bookName ;
String author ;
String page ;
var addBook=[];
class _AddBookState extends State<AddBook> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .5,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){Navigator.popAndPushNamed(context, '/home');},
        ),
        title: Text('Add Book'),
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
                height: 500,
                width: 500,

                margin: EdgeInsets.all(7),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Text('Book Name'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:<Widget> [
                            
                          ],
                        ),
                        Expanded(

                          child: Column(

                            children: [
                              _buildTextField('Name'),
                              _buildTextField('Author'),
                              _buildTextField('Page'),
                            ],
                          )
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(

                              child: ElevatedButton(onPressed: (){FileUploadInputElement();}, child: Text('Add Image'),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(40),
                margin : EdgeInsets.only(top :360),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                  children: [
                    ElevatedButton(onPressed: (){setBookInfo('Reading',bookName, author, page); Navigator.push(context,
                      MaterialPageRoute(builder:
                          (context){return home();},
                        settings: RouteSettings(
                            arguments: addBook
                        ),
                      ),
                    );
                    delTempBookInfo();
                    },
                      child: Text('Start Read'),
                    ),
                    ElevatedButton(onPressed: (){setBookInfo('Readed',bookName, author, page); Navigator.push(context,
                      MaterialPageRoute(builder:
                          (context){return home();},
                        settings: RouteSettings(
                            arguments: addBook
                        ),
                      ),
                    );
                    delTempBookInfo();

                    },
                      child: Text('End Reading'),),
                    ElevatedButton(onPressed: (){setBookInfo('ToRead',bookName, author, page); Navigator.push(context,
                      MaterialPageRoute(builder:
                          (context){return home();},
                        settings: RouteSettings(
                            arguments: addBook
                        ),
                      ),
                    );
                    delTempBookInfo();

                    },
                      child: Text('Add To Read'),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
  void setBookInfo(listType,bName,aName,pPage){
      addBook.add(listType);
      addBook.add(bName);
      addBook.add(aName);
      addBook.add(pPage);
  }
  void delTempBookInfo(){
    addBook.removeAt(0);
    addBook.removeAt(1);
    addBook.removeAt(2);
    addBook.removeAt(3);
  }
}
Widget _buildTextField(String textType){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        textType,
        style: kLabelStyle,
      ),
      SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: kBoxDecorationStyle,
        height: 60.0,
        child: TextField(
          keyboardType: textType=='Name'? TextInputType.name:
            textType=='Author'? TextInputType.name:
            TextInputType.number,
          onChanged:(text){textType=='Name' ? bookName = text:
            textType=='Author' ? author= text:
            page= text ;},
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.account_circle_rounded,
              color: Colors.white,
            ),
            hintText: textType,
            hintStyle: kHintTextStyle,
          ),
        ),
      ),
    ],
  );
}
