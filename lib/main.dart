import 'package:flutter/material.dart';
import 'package:flutter_coba1/UI/home.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter_coba1/UI/loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Coba Coba',
      // theme: ThemeData(
      //   // This is the theme of your application.
      //   //
      //   // Try running your application with "flutter run". You'll see the
      //   // application has a blue toolbar. Then, without quitting the app, try
      //   // changing the primarySwatch below to Colors.green and then invoke
      //   // "hot reload" (press "r" in the console where you ran "flutter run",
      //   // or simply save your changes to "hot reload" in a Flutter IDE).
      //   // Notice that the counter didn't reset back to zero; the application
      //   // is not restarted.
      //   primarySwatch: Colors.lightBlue,
      // ),
      home: PageLogin(),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: new Column(
//         children: <Widget>[
//           Image.asset('assets/appimages/cegahcovid.PNG'),
//           Container(
//             color: Colors.lightBlueAccent[100],
//             padding: const EdgeInsets.all(10),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Bagaimana mencegah COVID-19?',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 20),
//                       ),
//                       Text(
//                         'Tips hidup sehat mencegah COVID-19',
//                         style: TextStyle(
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.only(top: 10, bottom: 10),
//             decoration: BoxDecoration(
//               border: Border(
//                   bottom: BorderSide(color: Theme.of(context).dividerColor)),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Icon(Icons.phone, color: Colors.blue),
//                     Container(
//                       margin: const EdgeInsets.only(top: 8),
//                       child: Text(
//                         "Call",
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.blue,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Icon(Icons.favorite, color: Colors.pink),
//                     Container(
//                       margin: const EdgeInsets.only(top: 8),
//                       child: Text(
//                         "Route",
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.blue,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Icon(Icons.share, color: Colors.blue),
//                     Container(
//                       margin: const EdgeInsets.only(top: 8),
//                       child: Text(
//                         "Share",
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.blue,
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//           Container(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
//               child: Text(
//                 '''
//               1. Konsumsi Makanan Sehat untuk meningkatkan imunitas tubuh
//               2. Aktivitas Fisik 30 Menit/hari
//               3. Cuci tangan Anda secara rutin. Gunakan sabun dan air, atau cairan pembersih tangan berbahan alkohol
//               4. Ikuti vaksinasi ketika giliran Anda. Ikuti panduan setempat terkait vaksinasi.
//               ''',
//                 textAlign: TextAlign.left,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
