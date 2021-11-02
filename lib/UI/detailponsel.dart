import 'package:flutter/material.dart';
import 'package:flutter_coba1/Model/ponsel.dart';

class detailponsel extends StatefulWidget {
  detailponsel({required this.ponsel});
  final Ponsel ponsel;

  @override
  _detailponselState createState() => _detailponselState();
}

class _detailponselState extends State<detailponsel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ponsel.nama),
      ),
      body: Container(
        width: double.infinity,
        child: ListView(
          children: [
            Image.network(widget.ponsel.foto),
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
                widget.ponsel.kd_phone,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.lightBlue,
              width: double.infinity,
              height: double.maxFinite,
              child: new Text(widget.ponsel.asalhp),
            ),
          ],
        ),
      ),
    );
  }
}
