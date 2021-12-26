import 'package:flutter/foundation.dart';

class Brand {
  final int id_brand;
  final String nama_brand;

  Brand({
    required this.id_brand,
    required this.nama_brand,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id_brand: json["id_brand"],
        nama_brand: (json["nama_brand"] == null || json["nama_brand"] == '')
            ? ''
            : json["nama_brand"].toString(),
      );
  Map<String, dynamic> toJson() => {
        "nama_brand": nama_brand,
        "id_brand": id_brand,
      };
}
