import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:visitbogor/app/data/config.dart';
import 'package:visitbogor/app/data/wisata_model.dart';

class HomeServices {
  static var client = http.Client();

  static Future<List<WisataModel>?> fetchPopular() async {
    //http://flutter.id/apiwisata?modul=popular&token=25d55ad283aa400af464c76d713c07ad
    String url = baseUrl + "?modul=popular&token=" + token;
    var response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      //print(json.toString());
      var jsonString = jsonEncode(json['data']).toString();
      return wisataModelFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<List<WisataModel>?> fetchTop() async {
    String url = baseUrl + "?modul=top&token=" + token;
    var response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      //print(json.toString());
      var jsonString = jsonEncode(json['data']).toString();
      return wisataModelFromJson(jsonString);
    } else {
      return null;
    }
  }

  static Future<List<WisataModel>?> fetchKategori(String id) async {
    String url = baseUrl + "?modul=kategori&id=" + id + "&token=" + token;
    print(url.toString());
    var response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      //print(json.toString());
      var jsonString = jsonEncode(json['data']).toString();
      return wisataModelFromJson(jsonString);
    } else {
      return null;
    }
  }

  static updateCount(String id) async {
    String url =
        baseUrl + "?modul=hitcount&id=" + id.toString() + "&token=" + token;
    var response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      //print(json.toString());
      return json;
    } else {
      return null;
    }
  }
}
