import 'dart:convert';

import 'package:flutter_coba1/Model/pasien.dart';

class ApiStatic {
  static Future<List<Pasien>> getPasien1() async {
    List<Pasien> pasien = [];
    for (var i = 0; i < 10; i++) {
      pasien.add(Pasien(
        IDphone: i,
        nama: "Nama HP" + i.toString(),
        kdphone: "2021" + i.toString(),
        merk: "Xiamoi",
        asalhp: "China",
        foto: "assets/appimages/phone.png",
        createdAt: "",
        updatedAt: "",
      ));
    }
    return pasien;
  }

  static Future<List<Pasien>> getPasien() async {
    String response =
        '{"data":[{"IDphone":3,"nama":"X3 GT","kdphone":"2021","merk":"Xiaomi","asalhp":null,"foto":null,"created_at":"2021-09-25T13:53:19.000000Z","updated_at":"2021-09-25T13:53:19.000000Z"}]}';
    try {
      var json = jsonDecode(response);
      final parsed = json['data'].cast<Map<String, dynamic>>();
      return parsed.map<Pasien>((json) => Pasien.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }
}
