import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:flutter_coba1/Model/errMSG.dart';
import 'package:flutter_coba1/Model/ponsel.dart';
import 'package:flutter_coba1/Service/apiStatic.dart';
import 'package:flutter_coba1/UI/Modul/inputponsel.dart';
import 'package:flutter_coba1/UI/detailponsel.dart';
import 'package:flutter_coba1/UI/home.dart';

class ponselpage extends StatefulWidget {
  const ponselpage({Key? key}) : super(key: key);

  @override
  _ponselpageState createState() => _ponselpageState();
}

class _ponselpageState extends State<ponselpage> {
  late ErrorMSG response;
  final PagingController<int, Ponsel> _pagingController =
      PagingController(firstPageKey: 0);
  late TextEditingController _s;
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  late String _publish = "Y";
  void deletePonsel(id) async {
    response = await ApiStatic.deletePhone(id);
    final snackBar = SnackBar(
      content: Text(response.message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phones"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => InputPonsel(
                          ponsel: Ponsel(
                        id_phone: 0,
                        nama: '',
                        kd_phone: '',
                        merk: 0,
                        tahun: '',
                        foto: '',
                        asalhp: '',
                        createdAt: '',
                        updatedAt: '',
                      ))));
        },
      ),
      body: FutureBuilder<List<Ponsel>>(
        future: ApiStatic.getPonsel(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            List<Ponsel> listponsel = snapshot.data!;
            return Container(
              padding: EdgeInsets.all(5),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) => Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => detailponsel(
                                  ponsel: listponsel[index],
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Image.network(
                            //   listponsel[index].foto,
                            //   width: 20,
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4, right: 4),
                              child: Column(
                                children: [
                                  Text(listponsel[index].nama),
                                  Text(
                                    listponsel[index].kd_phone,
                                    style: TextStyle(fontSize: 8),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          new MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  InputPonsel(
                                                    ponsel: listponsel[index],
                                                  )));
                                    },
                                    child: Icon(Icons.edit)),
                                GestureDetector(
                                    onTap: () {
                                      deletePonsel(listponsel[index].id_phone);
                                    },
                                    child: Icon(Icons.delete)),
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
                  builder: (BuildContext context) => ponselpage()));
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
