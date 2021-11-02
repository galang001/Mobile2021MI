import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coba1/Model/ponsel.dart';
import 'package:flutter_coba1/Service/apiStatic.dart';

import 'kategori.dart';

class bodykonten extends StatelessWidget {
  const bodykonten({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Handphone",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          kategori(),
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                margin:
                    EdgeInsets.only(left: 10, top: 20, bottom: 20, right: 20),
                height: 200,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 5,
                      )
                    ],
                    image: DecorationImage(
                      image: new AssetImage('assets/appimages/phone.png'),
                      fit: BoxFit.scaleDown,
                    )),
              ),
            ],
          )
        ]);
  }
}
