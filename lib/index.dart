import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'pages/chat-page.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => ChatPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 45),
              child: Container(
                child: Text(
                  "Hello !",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 250),
            Center(child: Text("Loarding...")),
            Padding(
              padding: const EdgeInsets.only(left: 150),
              child: Row(
                children: <Widget>[
                  SpinKitThreeBounce(
                                      color: Colors.white,
                                      size: 30.0,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  
                   
}
