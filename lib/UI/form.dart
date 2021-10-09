import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coba1/Model/pasien.dart';
import 'package:flutter_coba1/Service/apiStatic.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

void main() => runApp(formbody());

class formbody extends StatelessWidget {
  const formbody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Form Validation';

    return MaterialApp(
        title: appTitle,
        home: Scaffold(
          appBar: AppBar(
            title: Text(appTitle),
          ),
          body: formpage(),
        ));
  }
}

class formpage extends StatefulWidget {
  @override
  _formpageState createState() {
    return _formpageState();
  }
}

class _formpageState extends State<formpage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController kdphoneController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController tahunController = TextEditingController();
  TextEditingController asalhpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Mohon Isi Dengan Lengkap';
                  }
                  return null;
                },
                controller: kdphoneController,
                decoration: InputDecoration(
                  labelText: 'Kode Ponsel',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3.0)),
                )),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
                controller: namaController,
                decoration: InputDecoration(
                  labelText: 'Kode Ponsel',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3.0)),
                )),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: tahunController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tahun Ponsel',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3.0)),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Diisi Menggunakan Angka';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
                controller: asalhpController,
                decoration: InputDecoration(
                  labelText: 'Asal Ponsel',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3.0)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
