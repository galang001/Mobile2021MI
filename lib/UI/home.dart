import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_coba1/UI/pasien.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informasi Handphone"),
      ),
      body: Center(
        child: Text("Isi Home Page"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (i) {
          switch (i) {
            case 0:
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (BuildContext context) => homepage()));
              break;
            case 1:
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (BuildContext context) => pasienpage()));
              break;
            default:
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle_rounded),
              title: Text("Phones")),
        ],
      ),
    );
  }
}
