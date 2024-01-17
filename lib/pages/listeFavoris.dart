import 'package:flutter/material.dart';
import 'package:test_technique/Model/country.dart';

class listeFvoris extends StatefulWidget {
  final List<Country> listeFavories;
  listeFvoris({super.key, required this.listeFavories});

  @override
  State<listeFvoris> createState() => _listeFvorisState();
}

class _listeFvorisState extends State<listeFvoris> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lucky Trip",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        ],
      ),
      body: Column(children: [
      //  Text(
      //                                 listeFvoris[],
      //                                 style: TextStyle(
      //                                   fontSize: 18.0,
      //                                   fontWeight: FontWeight.bold,
      //                                 ),
      //                               ),
      ]),
    );
  }
}
