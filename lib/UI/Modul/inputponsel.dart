import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_coba1/Model/brand.dart';
import 'package:flutter_coba1/Model/errMSG.dart';
import 'package:flutter_coba1/Model/ponsel.dart';
import 'package:flutter_coba1/Service/apiStatic.dart';
import 'package:flutter_coba1/UI/ponsellist.dart';
import 'package:image_picker/image_picker.dart';

class InputPonsel extends StatefulWidget {
  final Ponsel ponsel;
  InputPonsel({required this.ponsel});
  @override
  _InputPonselState createState() => _InputPonselState();
}

class _InputPonselState extends State<InputPonsel> {
  final _formkey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  late TextEditingController nama, kd_phone, tahun, asalhp, merk, foto;
  late List<Brand> _brand = [];
  late int id_brand = 0;
  late int id_phone = 0;
  late String _imagePath = "";
  late String _imageURL = "";
  late ErrorMSG response;
  bool _isupdate = false;
  bool _success = false;
  bool _validate = false;

  void getBrand() async {
    final response = await ApiStatic.getBrand();
    setState(() {
      _brand = response.toList();
    });
  }

  void submit() async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      var params = {
        'nama': nama.text.toString(),
        'kd_phone': kd_phone.text.toString(),
        'tahun': tahun.text.toString(),
        'asalhp': asalhp.text.toString(),
        'merk': id_brand,
      };
      response = await ApiStatic.savePonsel(id_phone, params, _imagePath);
      _success = response.success;
      final snackBar = SnackBar(
        content: Text(response.message),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      if (_success) {
        Navigator.of(context).pushReplacement(new MaterialPageRoute(
            builder: (BuildContext context) => ponselpage()));
      } else {
        _validate = true;
      }
    }
  }

  @override
  void initState() {
    nama = TextEditingController();
    kd_phone = TextEditingController();
    tahun = TextEditingController();
    asalhp = TextEditingController();
    getBrand();
    if (widget.ponsel.id_phone != 0) {
      nama = TextEditingController(text: widget.ponsel.nama);
      kd_phone = TextEditingController(text: widget.ponsel.kd_phone);
      tahun = TextEditingController(text: widget.ponsel.tahun);
      asalhp = TextEditingController(text: widget.ponsel.asalhp);
      id_brand = widget.ponsel.merk;
      _isupdate = true;
      _imageURL = "http://192.168.1.4/API2021/public/" + widget.ponsel.foto;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isupdate ? Text(widget.ponsel.nama) : Text('Input Data'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextFormField(
                    controller: nama,
                    validator: (u) => u == null ? "Wajib Diisi" : null,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.perm_identity),
                      hintText: 'Nama HP',
                      labelText: 'Nama HP',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextFormField(
                    controller: kd_phone,
                    validator: (u) => u == null ? "Wajib Diisi" : null,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.perm_identity),
                      hintText: 'Kode HP',
                      labelText: 'Kode HP',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextFormField(
                    controller: tahun,
                    validator: (u) => u == null ? "Wajib Diisi" : null,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.perm_identity),
                      hintText: 'Tahun HP',
                      labelText: 'Tahun HP',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextFormField(
                    controller: asalhp,
                    validator: (u) => u == null ? "Wajib Diisi" : null,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.perm_identity),
                      hintText: 'Asal HP',
                      labelText: 'Asal HP',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: DropdownButtonFormField(
                    value: id_brand == 0 ? null : id_brand,
                    hint: Text("Pilih Brand"),
                    decoration: const InputDecoration(
                      icon: Icon(Icons.category_rounded),
                    ),
                    items: _brand.map((item) {
                      return DropdownMenuItem(
                        child: Text(item.nama_brand),
                        value: item.id_brand.toInt(),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        id_brand = value as int;
                      });
                    },
                    validator: (u) => u == null ? "Wajib Diisi" : null,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.image),
                      Flexible(
                          child: _imagePath != ''
                              ? GestureDetector(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      File(_imagePath),
                                      fit: BoxFit.fitWidth,
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              5,
                                    ),
                                  ),
                                  onTap: () {
                                    getImage(ImageSource.gallery);
                                  })
                              : _imageURL != ''
                                  ? GestureDetector(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.network(
                                          _imageURL,
                                          fit: BoxFit.fitWidth,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              5,
                                        ),
                                      ),
                                      onTap: () {
                                        getImage(ImageSource.gallery);
                                      })
                                  : GestureDetector(
                                      onTap: () {
                                        getImage(ImageSource.gallery);
                                      },
                                      child: Container(
                                        height: 100,
                                        child: (Row(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 24),
                                            ),
                                            Text("Ambil Gambar")
                                          ],
                                        )),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color:
                                                        Colors.green.shade600,
                                                    width: 1))),
                                      ),
                                    ))
                    ],
                  ),
                ),
                Divider(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                  child: RaisedButton(
                    color: Colors.green,
                    child: Text(
                      'Simpan',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      submit();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future getImage(ImageSource media) async {
    var img = await _picker.pickImage(source: media);

    setState(() {
      _imagePath = img!.path;
      print(_imagePath);
    });
  }
}
