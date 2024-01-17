import 'dart:convert';

import 'package:test_technique/Model/country.dart';
import 'package:http/http.dart' as http;

class CountryApi {
  final String apiKey =
      '5ae2e3f221c38a28845f05b6e1e72f6e6fae9bc6a9473af209e333f9';
  Future<List<Country>?> getAllCountries() async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://api.opentripmap.com/0.1/en/places/radius?apikey=5ae2e3f221c38a28845f05b6e1e72f6e6fae9bc6a9473af209e333f9&radius=5000&lon=10.63699&lat=35.82539&rate=3&format=json');

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      return countryFromJson(const Utf8Decoder().convert(response.bodyBytes));
    }
    return null;
  }

  Future<Country?> getDetails(String xid) async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://api.opentripmap.com/0.1/en/places/xid/$xid?apikey=$apiKey');

    try {
      var response = await client.get(uri);
      if (response.statusCode == 200) {
        return Country.fromJson(json.decode(response.body));
      } else {
        print("Erreur lors de la récupération des détails du pays.");
        return null;
      }
    } catch (e) {
      print("Erreur lors de la requête vers l'API : $e");
      return null;
    } finally {
      client.close();
    }
  }
}
