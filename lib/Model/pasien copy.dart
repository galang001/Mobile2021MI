import 'package:flutter/foundation.dart';

class Ponsel {
  final int id_phone;
  final String nama;
  final String kd_phone;
  final String merk;
  final String asalhp;
  final String foto;
  final String createdAt;
  final String updatedAt;

  Ponsel({
    required this.id_phone,
    required this.nama,
    required this.kd_phone,
    required this.merk,
    required this.asalhp,
    required this.foto,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Ponsel.fromJson(Map<String, dynamic> json) => Ponsel(
        id_phone: json["id_phone"],
        nama: json["nama"].toString(),
        kd_phone: json["kd_phone"].toString(),
        merk: json["merk"].toString(),
        asalhp: json["asalhp"].toString(),
        foto: json["foto"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["update_at"].toString(),
      );
  Map<String, dynamic> toJson() => {
        'nama': nama,
        'kd_phone': kd_phone,
        'merk': merk,
        'asalhp': asalhp,
        'foto': foto,
      };
}
