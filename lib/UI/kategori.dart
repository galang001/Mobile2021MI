import 'package:flutter/material.dart';

class kategori extends StatefulWidget {
  const kategori({Key? key}) : super(key: key);

  @override
  _kategoriState createState() => _kategoriState();
}

class _kategoriState extends State<kategori> {
  List<String> kategori = ["Xiaomi", "Samsung", "Oppo", "Vivo"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 70, left: 6),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: kategori.length,
            itemBuilder: (context, index) => buildkategori(index)),
      ),
    );
  }

  Widget buildkategori(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 70, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              kategori[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:
                      selectedIndex == index ? Colors.black87 : Colors.black54),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              height: 2,
              width: 30,
              color:
                  selectedIndex == index ? Colors.black54 : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
