import 'package:flutter/material.dart';
import 'package:flutter_coba1/Model/pasien.dart';

class detailpasien extends StatefulWidget {
  detailpasien({required this.pasien});
  final Pasien pasien;

  @override
  _detailpasienState createState() => _detailpasienState();
}

class _detailpasienState extends State<detailpasien> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pasien.nama),
      ),
      body: Container(
        width: double.infinity,
        child: ListView(
          children: [
            Image.network(widget.pasien.foto),
            Container(
              padding: EdgeInsets.all(5),
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color(0xff3164bd), const Color(0xff295cb5)],
                ),
              ),
              child: Text(
                widget.pasien.nik,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.lightBlue,
              width: double.infinity,
              height: double.maxFinite,
              child: new Text(widget.pasien.alamat),
            ),
          ],
        ),
      ),
    );
  }
}
