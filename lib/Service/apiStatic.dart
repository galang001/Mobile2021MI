import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_coba1/Model/ponsel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_coba1/Model/brand.dart';
import 'package:flutter_coba1/Model/errMSG.dart';

class ApiStatic {
  static var _token = "17|9y9qPZTbhabRlvcTDyS0K734EVVwkgRM1WNNckp8";
  static final host = 'http://192.168.1.4/API2021/public/api';
  // Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  // static Future<void> getPref() async {
  //   Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  //   final SharedPreferences prefs = await preferences;
  //   _token = prefs.getString('token') ?? "";
  // }

  static getHost() {
    return host;
  }

  // static Future<List<Ponsel>> getPonsel1() async {
  //   List<Ponsel> Ponsel = [];
  //   for (var i = 0; i < 10; i++) {
  //     Ponsel.add(Ponsel(
  //       IDphone: i
  //       nama: "Nama HP" + i.toString(),
  //       kdphone: "2021" + i.toString(),
  //       merk: "Xiamoi",
  //       asalhp: "China",
  //       foto: "assets/appimages/phone2.png",
  //       createdAt: "",
  //       updatedAt: "",
  //     ));
  //   }
  //   return Ponsel;
  // }

  static Future<List<Ponsel>> getPonsel() async {
    // String response =
    //     '{"data":[{"IDphone":3,"nama":"X3 GT","kdphone":"2021","merk":"Xiaomi","asalhp":null,"foto":null,"created_at":"2021-09-25T13:53:19.000000Z","updated_at":"2021-09-25T13:53:19.000000Z"}]}';
    try {
      final response = await http.get(
          Uri.parse('http://192.168.1.4/API2021/public/api/phone'),
          headers: {
            'Authorization': 'Bearer' + _token,
          });
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data'].cast<Map<String, dynamic>>();
        return parsed.map<Ponsel>((json) => Ponsel.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static Future<List<Ponsel>> getPonselFilter(
      int pageKey, String _s, String _selectedChoice) async {
    try {
      final response = await http.get(
          Uri.parse("http://192.168.1.4/API2021/public/api/phone?page=" +
              pageKey.toString() +
              "&s=" +
              _s +
              "&publish=" +
              _selectedChoice),
          headers: {
            'Authorization': 'Bearer ' + _token,
          });
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data'].cast<Map<String, dynamic>>();
        return parsed.map<Ponsel>((json) => Ponsel.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static Future<List<Brand>> getBrand() async {
    // String response =
    //     '{"data":[{"IDphone":3,"nama":"X3 GT","kdphone":"2021","merk":"Xiaomi","asalhp":null,"foto":null,"created_at":"2021-09-25T13:53:19.000000Z","updated_at":"2021-09-25T13:53:19.000000Z"}]}';
    try {
      final response = await http.get(
          Uri.parse('http://192.168.1.4/API2021/public/api/brand'),
          headers: {
            'Authorization': 'Bearer' + _token,
          });
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json.cast<Map<String, dynamic>>();
        return parsed.map<Brand>((json) => Brand.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static Future<ErrorMSG> savePonsel(id, ponsel, filepath) async {
    try {
      var url = Uri.parse('http://192.168.1.4/API2021/public/api/phone');
      if (id != 0) {
        url = Uri.parse(
            'http://192.168.1.4/API2021/public/api/phone' + id.toString());
      }

      var request = http.MultipartRequest('POST', url);
      request.fields['nama'] = ponsel['nama'];
      request.fields['kd_phone'] = ponsel['kd_phone'];
      request.fields['tahun'] = ponsel['tahun'];
      request.fields['asalhp'] = ponsel['asalhp'];
      request.fields['merk'] = ponsel['merk'].toString();

      if (filepath != '') {
        request.files.add(await http.MultipartFile.fromPath('foto', filepath));
      }
      request.headers.addAll({
        'Authorization': 'Bearer' + _token,
      });

      var response = await request.send();

      if (response.statusCode == 200) {
        final respStr = await response.stream.bytesToString();
        return ErrorMSG.fromJson(jsonDecode(respStr));
      } else {
        return ErrorMSG(success: false, message: 'err Request');
      }
    } catch (e) {
      ErrorMSG responseRequest =
          ErrorMSG(success: false, message: 'Error Caught : $e');
      return responseRequest;
    }
  }

  static Future<ErrorMSG> deletePhone(id_phone) async {
    try {
      final response = await http.delete(
          Uri.parse('http://192.168.1.4/API2021/public/api/phone' +
              id_phone.toString()),
          headers: {
            'Authorization': 'Bearer' + _token,
          });
      if (response.statusCode == 200) {
        return ErrorMSG.fromJson(jsonDecode(response.body));
      } else {
        return ErrorMSG(
            success: false, message: 'Periksa Kembali Inputan Anda');
      }
    } catch (e) {
      ErrorMSG responseRequest =
          ErrorMSG(success: false, message: 'error caught: $e');
      return responseRequest;
    }
  }

  static Future<ErrorMSG> sigIn(_post) async {
    try {
      final response = await http.post(
          Uri.parse('http://192.168.1.4/API2021/public/api/login'),
          body: _post);
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        print(res);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', res['token']);
        prefs.setString('name', res['user']['name']);
        prefs.setString('email', res['user']['email']);
        prefs.setInt('level', 1);
        return ErrorMSG.fromJson(res);
      } else {
        return ErrorMSG.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      ErrorMSG responseRequest =
          ErrorMSG(success: false, message: 'error caught: $e');
      return responseRequest;
    }
  }
}
