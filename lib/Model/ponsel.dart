import 'package:flutter/foundation.dart';

class Ponsel {
  final int id_phone;
  final String nama;
  final String kd_phone;
  final int merk;
  final String asalhp;
  final String tahun;
  final String foto;
  final String createdAt;
  final String updatedAt;

  Ponsel({
    required this.id_phone,
    required this.nama,
    required this.kd_phone,
    required this.merk,
    required this.tahun,
    required this.asalhp,
    required this.foto,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Ponsel.fromJson(Map<String, dynamic> json) => Ponsel(
        id_phone: json["id_phone"],
        nama: json["nama"].toString(),
        kd_phone: json["kd_phone"].toString(),
        merk: json["merk"],
        tahun: json["tahun"],
        asalhp: json["asalhp"].toString(),
        foto: json["foto"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["update_at"].toString(),
      );
  Map<String, dynamic> toJson() => {
        'nama': nama,
        'kd_phone': kd_phone,
        'merk': merk,
        'tahun': tahun,
        'asalhp': asalhp,
        'foto': foto,
      };
}
