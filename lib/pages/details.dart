import 'package:flutter/material.dart';
import 'package:test_technique/Model/country.dart';

class DetailsPage extends StatelessWidget {
  final Country country;

  DetailsPage({required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lucky Trip",
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
        ),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start, // Align left
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Center(
              child: Container(
                child: Text(
                  "${country.name}",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 150),
              child: Image.network("${country.image}")),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              "${country.name}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text("${country.kinds}")),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text("${country.kinds}")),
        ],
      ),
    );
  }
}
