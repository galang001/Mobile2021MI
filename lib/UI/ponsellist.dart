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
  int _pageSize = 3;

  void deletePonsel(id_phone) async {
    response = await ApiStatic.deletePhone(id_phone);
    final snackBar = SnackBar(
      content: Text(response.message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _fetchPage(int pageKey, _s, _publish) async {
    try {
      final newItems = await ApiStatic.getPonselFilter(pageKey, _s, _publish);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void initState() {
    _s = TextEditingController();
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey, _s.text, _publish);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
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
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            padding: EdgeInsets.only(top: 80),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: RefreshIndicator(
              onRefresh: () => Future.sync(() => _pagingController.refresh()),
              child: PagedListView<int, Ponsel>(
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<Ponsel>(
                  itemBuilder: (context, item, index) => Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => detailponsel(
                                  ponsel: item,
                                )));
                      },
                      child: Container(
                        height: 150,
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(top: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.white,
                            border: Border.all(width: 1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Image.network(
                            //   ApiStatic.host + '/' + item.foto,
                            //   width: 30,
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Column(
                                children: [
                                  Text(item.nama),
                                  Text(
                                    item.kd_phone,
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
                                                    ponsel: item,
                                                  )));
                                    },
                                    child: Icon(Icons.edit)),
                                GestureDetector(
                                    onTap: () {
                                      deletePonsel(item.id_phone);
                                      _pagingController.refresh();
                                    },
                                    child: Icon(Icons.delete)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () => _scaffoldkey.currentState!.openDrawer(),
                    icon: Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Data Ponsel",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  PopupMenuButton(
                    icon: Icon(
                      Icons.filter_list,
                      color: Colors.black,
                    ),
                    initialValue: _publish,
                    onSelected: (String result) {
                      setState(() {
                        _publish = result;
                        _pagingController.refresh();
                      });
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuItem<String>>[
                      new PopupMenuItem<String>(
                          child: const Text('Aktif'), value: 'Y'),
                      new PopupMenuItem<String>(
                          child: const Text('Non Aktif'), value: 'N'),
                      new PopupMenuItem<String>(
                          child: const Text('Semua'), value: 'All'),
                      new PopupMenuItem<String>(
                          child: const Text('Deleted'), value: 'del'),
                    ],
                  )
                ],
              ),
            ),
          ),
          //contaoner untuk search
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: TextField(
                      controller: _s,
                      onSubmitted: (_s) {
                        _pagingController.refresh();
                      },
                      cursorColor: Theme.of(context).primaryColor,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      decoration: InputDecoration(
                          hintText: "Masukkan Nama Ponsel",
                          hintStyle:
                              TextStyle(color: Colors.black38, fontSize: 16),
                          prefixIcon: Material(
                            elevation: 0.0,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: Icon(Icons.search),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13)),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
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
