import 'package:flutter/material.dart';
import 'package:flutter_coba1/Model/pasien.dart';
import 'package:flutter_coba1/Service/apiStatic.dart';
import 'package:flutter_coba1/UI/detailpasien.dart';
import 'package:flutter_coba1/UI/home.dart';

class pasienpage extends StatefulWidget {
  const pasienpage({Key? key}) : super(key: key);

  @override
  _pasienpageState createState() => _pasienpageState();
}

class _pasienpageState extends State<pasienpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Phones")),
      body: FutureBuilder<List<Pasien>>(
        future: ApiStatic.getPasien(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            List<Pasien> listpasien = snapshot.data!;
            return Container(
              padding: EdgeInsets.all(5),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) => Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => detailpasien(
                                  pasien: listpasien[index],
                                )));
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(top: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.white,
                            border: Border.all(
                                width: 1, color: Colors.lightGreenAccent)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              listpasien[index].foto,
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text(listpasien[index].nama),
                                Text(
                                  listpasien[index].merk,
                                  style: TextStyle(fontSize: 8),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1,
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
