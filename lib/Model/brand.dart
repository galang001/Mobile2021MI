import 'package:flutter/foundation.dart';

class Brand {
  final int id_brand;
  final String nama_brand;
  final String createdAt;
  final String updatedAt;

  Brand({
    required this.id_brand,
    required this.nama_brand,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id_brand: json["id_brand"],
        nama_brand: json["nama_brand"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["update_at"].toString(),
      );
  Map<String, dynamic> toJson() => {
        'nama_brand': nama_brand,
      };
}
