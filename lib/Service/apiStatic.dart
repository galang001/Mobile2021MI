import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_coba1/Model/pasien.dart';

class ApiStatic {
  static final host = 'http://192.168.1.5/API2021/public/api/phone';
  static getHost() {
    return host;
  }

  static Future<List<Pasien>> getPasien1() async {
    List<Pasien> pasien = [];
    for (var i = 0; i < 10; i++) {
      pasien.add(Pasien(
        IDphone: i,
        nama: "Nama HP" + i.toString(),
        kdphone: "2021" + i.toString(),
        merk: "Xiamoi",
        asalhp: "China",
        foto: "assets/appimages/phone2.png",
        createdAt: "",
        updatedAt: "",
      ));
    }
    return pasien;
  }

  static Future<List<Pasien>> getPasien() async {
    // String response =
    //     '{"data":[{"IDphone":3,"nama":"X3 GT","kdphone":"2021","merk":"Xiaomi","asalhp":null,"foto":null,"created_at":"2021-09-25T13:53:19.000000Z","updated_at":"2021-09-25T13:53:19.000000Z"}]}';
    try {
      final response = await http.get(Uri.parse("$host/api/post"));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data'].cast<Map<String, dynamic>>();
        return parsed.map<Pasien>((json) => Pasien.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
