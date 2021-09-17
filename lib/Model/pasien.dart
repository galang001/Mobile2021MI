import 'package:flutter/foundation.dart';

class Pasien {
  Pasien({
    required this.IDpasien,
    required this.nama,
    required this.nik,
    required this.jkelamin,
    required this.alamat,
    required this.foto,
    required this.createdAt,
    required this.updatedAt,
  });
  int IDpasien;
  String nama;
  String nik;
  String jkelamin;
  String alamat;
  String foto;
  String createdAt;
  String updatedAt;

  factory Pasien.fromJson(Map<String, dynamic> json) => Pasien(
        IDpasien: json["ID_Pasien"],
        nama: json["nama"].toString(),
        nik: json["nik"].toString(),
        jkelamin: json["jkelamin"].toString(),
        alamat: json["alamat"].toString(),
        foto: json["foto"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["update_at"].toString(),
      );
}
