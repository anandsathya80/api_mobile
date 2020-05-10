import 'package:flutter/material.dart';
import 'package:flutter_api/app.dart';
import 'app.dart';


class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
            child: new Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top:30),
                  child: Text(
                    'INDUSTRI TECH',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 0.2,
                      height: 1,
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Image.asset('asset/industri.jpg'),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context)=> App()),
                      );
                    },
                    color: Color(0xff18392b),

                    child: Text('data karyawan',
                      style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}
