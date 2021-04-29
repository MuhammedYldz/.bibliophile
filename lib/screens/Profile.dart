import 'package:flutter/material.dart';
import 'package:bibliophile/screens/home.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

var userInfo=[];
String userPassword;
String userMail;

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {

    userInfo=ModalRoute.of(context).settings.arguments;
    userMail= userInfo[0];
    userPassword= userInfo[1];

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(child: Text('Page\'s'),decoration: BoxDecoration(color: Colors.blue),),
              ListTile(title:Text('Home'),onTap: (){Navigator.push(
                context,
                MaterialPageRoute(builder:
                    (context){return home();},
                  settings: RouteSettings(
                      arguments: userInfo
                      ),
                    ),
                  );
                },
              ),
              ListTile(title:Text('Reading Books'),onTap: (){Navigator.pushNamed(context,'/ReadedBooks');},),
              ListTile(title:Text('Readed Books'),onTap: (){Navigator.pushNamed(context,'/ReadedBooks');},),
              ListTile(title:Text('To Read Books'),onTap: (){Navigator.pushNamed(context,'/ToReadBooks');},),
              ListTile(title:Text('About'),onTap: (){Navigator.pushNamed(context,'/About');},),
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
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Text(userMail),
                ],
              ),
              Row(
                children: [
                  Text(userPassword),
                ],
              )
            ],
          ),

        ),
      ),

    );
  }
}

