import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test_technique/Model/country.dart';
import 'package:test_technique/Service/country_service.dart';
import 'package:test_technique/pages/details.dart';
import 'package:test_technique/pages/listeFavoris.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Country> countries = [];

  final CountryService countryService = CountryService();
  List<Country> listeFavories = [];
  List<String> items = [
    "Tunis",
    "Sousse",
    "Ariana",
    "Bizerte",
    "Sfax",
    "Manouba"
  ];
  String? selectedValue;

  List<Country> getListeFavories() {
    return listeFavories;
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      print("Latitude: ${position.latitude}, Longitude: ${position.longitude}");
    } catch (e) {
      print("Erreur lors de la récupération de la localisation : $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      List<Country>? fetchedCountries = await countryService.getAllCountries();

      if (fetchedCountries != null) {
        print("Données récupérées avec succès : $fetchedCountries");
        setState(() {
          countries = fetchedCountries;
        });
        print("La liste des pays a été mise à jour : $countries");
      } else {
        print("Aucune donnée récupérée.");
      }
    } catch (e) {
      print("Erreur lors de la récupération des données : $e");
    }
  }

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
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                DropdownButton<String>(
                  value: selectedValue,
                  items: items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue;
                    });
                  },
                  hint: Text('Select a city'),
                ),
                SizedBox(width: 16.0),
                TextButton(
                  onPressed: () {
                    if (selectedValue != null) {
                    } else {}
                  },
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          _getCurrentLocation();
                        },
                        icon: Icon(
                          Icons.my_location,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Use my location',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Places of interests (${countries.length})",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
              ),
            ),
          ]),
          Expanded(
            child: countries.isNotEmpty
                ? ListView.builder(
                    itemCount: countries.length,
                    itemBuilder: (context, index) {
                      print(" $index : ${countries[index].name}");
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                  country: countries[index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            margin: EdgeInsets.only(bottom: 16.0),
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      countries[index].name,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      countries[index].kinds,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  bottom: 10,
                                  right: 0,
                                  child: Text(
                                    ('${countries[index].dist.toStringAsFixed(2)} m '),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: IconButton(
                                    onPressed: () {
                                      print("${countries[index].name}");
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => listeFvoris(
                                              listeFavories: listeFavories),
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.favorite),
                                  ),
                                ),
                              ],
                            ),
                          ));
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ],
      ),
    );
  }
}
