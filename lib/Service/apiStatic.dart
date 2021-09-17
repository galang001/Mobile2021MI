import 'package:flutter_coba1/Model/pasien.dart';

class ApiStatic {
  static Future<List<Pasien>> getPasien() async {
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
}
