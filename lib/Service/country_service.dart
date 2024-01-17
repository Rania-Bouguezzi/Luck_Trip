import 'package:test_technique/Model/country.dart';
import 'package:test_technique/Provider/country_api.dart';

class CountryService {
  final _api = CountryApi();
  Future<List<Country>?> getAllCountries() async {
    return _api.getAllCountries();
  }
}
