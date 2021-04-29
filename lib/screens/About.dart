import 'package:flutter/material.dart';
class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(child: Text('Page\'s'),decoration: BoxDecoration(color: Colors.blue),),
              ListTile(title:Text('Home'),onTap: (){Navigator.pushNamed(context,'/home');},),
              ListTile(title:Text('Reading Books'),onTap: (){Navigator.pushNamed(context,'/ReadingBooks');},),
              ListTile(title:Text('Reading Books'),onTap: (){Navigator.pushNamed(context,'/ReadedBooks');},),
              ListTile(title:Text('To Read Books'),onTap: (){Navigator.pushNamed(context,'/ToReadBooks');},),
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
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Column(
                   mainAxisAlignment: MainAxisAlignment.center,

                   children: [
                     Text('Bu uygulama Dr.Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen,',
                       style: TextStyle(
                         fontSize: 13,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     Text('3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında ',
                       style: TextStyle(
                         fontSize: 13,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                    Text('173004033 numaralı Muhammed YILDIZ tarafından 30 Nisan 2021 günü yapılmıştır. ',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                   ],
                 )
               ],
             ),
        ),
      ),
      );
  }
}
