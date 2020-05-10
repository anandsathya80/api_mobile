import 'package:flutter/material.dart';
import 'form_add_screen.dart';
import 'home_screen.dart';

GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xff18392b),
        accentColor: Color(0xff18392b),
      ),
      home: Scaffold(
        backgroundColor: Color(0xffd0ded8) ,
        key: _scaffoldState,
        appBar: AppBar(
          title: Text(
            "DATA KARYAWAN",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: HomeScreen(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(
                  _scaffoldState.currentContext,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return FormAddScreen();
                  }),
                );
          },
          child: Icon(Icons.add, ),
        ),
      ),
    );
  }
}