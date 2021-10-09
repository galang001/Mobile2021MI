import 'package:flutter/material.dart';
import 'package:flutter_coba1/UI/pasien.dart';
import 'package:flutter_coba1/UI/form.dart';
import 'package:flutter_coba1/UI/isikonten.dart';
import 'package:flutter_coba1/Model/pasien.dart';
import 'package:flutter_coba1/Service/apiStatic.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: bodykonten(),
      // child: Text("Isi Home Page"),

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
            case 2:
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (BuildContext context) => formpage()));
              break;
            default:
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle_rounded),
              title: Text("Phones")),
          BottomNavigationBarItem(icon: Icon(Icons.book), title: Text("Form")),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 5,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_rounded),
        onPressed: () {},
      ),
      title: Text("Produk Handphone"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search_rounded),
          onPressed: () {},
        ),
      ],
    );
  }
}
