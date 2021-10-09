import 'package:flutter/foundation.dart';

class Pasien {
  Pasien({
    required this.IDphone,
    required this.nama,
    required this.kdphone,
    required this.merk,
    required this.asalhp,
    required this.foto,
    required this.createdAt,
    required this.updatedAt,
  });
  int IDphone;
  String nama;
  String kdphone;
  String merk;
  String asalhp;
  String foto;
  String createdAt;
  String updatedAt;

  factory Pasien.fromJson(Map<String, dynamic> json) => Pasien(
        IDphone: json["IDphone"],
        nama: json["nama"].toString(),
        kdphone: json["kdphone"].toString(),
        merk: json["merk"].toString(),
        asalhp: json["asalhp"].toString(),
        foto: json["foto"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["update_at"].toString(),
      );
}
