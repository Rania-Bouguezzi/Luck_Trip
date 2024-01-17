import 'dart:convert';

List<Country> countryFromJson(String str) =>
    List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

String countryToJson(List<Country> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Country {
  String xid;
  String name;
  double dist;
  int rate;
  String? osm;
  String wikidata;
  String kinds;
  Point point;
  String? image;

  Country({
    required this.xid,
    required this.name,
    required this.dist,
    required this.rate,
    required this.osm,
    required this.wikidata,
    required this.kinds,
    required this.point,
    required this.image,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      xid: json['xid'],
      name: json['name'],
      dist: json['dist'].toDouble(),
      rate: json['rate'],
      osm: json['osm'],
      wikidata: json['wikidata'],
      kinds: json['kinds'],
      point: Point.fromJson(json['point']),
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['xid'] = this.xid;
    data['name'] = this.name;
    data['dist'] = this.dist;
    data['rate'] = this.rate;
    data['osm'] = this.osm;
    data['wikidata'] = this.wikidata;
    data['kinds'] = this.kinds;
    data['point'] = this.point.toJson();
    data['image'] = this.image;
    return data;
  }
}

class Point {
  double lon;
  double lat;

  Point({
    required this.lon,
    required this.lat,
  });

  factory Point.fromJson(Map<String, dynamic> json) {
    return Point(
      lon: json['lon'].toDouble(),
      lat: json['lat'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lon'] = this.lon;
    data['lat'] = this.lat;
    return data;
  }
}
