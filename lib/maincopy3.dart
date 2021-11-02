import 'package:flutter/material.dart';
import 'package:flutter_coba1/UI/form.dart';
import 'package:flutter_coba1/UI/home.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coba Coba',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.lightBlue,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: formpage(),
      ),
    );
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
  final format = DateFormat('yyyy-MM-dd');
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
                  labelText: 'Nama Ponsel',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3.0)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: <Widget>[
              DateTimeField(
                controller: tahunController,
                format: format,
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                      context: context,
                      firstDate: DateTime(2021),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2045));
                },
                decoration: InputDecoration(
                  labelText: 'Tahun Ponsel',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3.0)),
                ),
                validator: (dateTime) {
                  if (dateTime == null) {
                    return "Mohon Diisi Tanggal";
                  }
                  return null;
                },
              ),
            ]),
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
