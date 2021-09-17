import 'package:flutter_coba1/Model/pasien.dart';

class ApiStatic {
  static Future<List<Pasien>> getPasien() async {
    List<Pasien> pasien = [];
    for (var i = 0; i < 10; i++) {
      pasien.add(Pasien(
        IDpasien: i,
        nama: "Nama Pasien" + i.toString(),
        nik: "2021" + i.toString(),
        jkelamin: "Laki-Laki",
        alamat: "Buleleng",
        foto: "assets/appimages/usericon.jpg",
        createdAt: "",
        updatedAt: "",
      ));
    }
    return pasien;
  }
}
