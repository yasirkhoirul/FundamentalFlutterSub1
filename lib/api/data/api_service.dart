import 'dart:convert';

import 'package:fundamental_submission1/api/model/restoran.dart';
import 'package:http/http.dart' as http;
import 'package:logger/web.dart';

class Constant {
  static const url = "https://restaurant-api.dicoding.dev";
  static const imageUrl = "https://restaurant-api.dicoding.dev/images/small";
}

class Apiservice {
  Future<Restoranlist> getListRestoran() async {
    final result = await http.get(Uri.parse("${Constant.url}/list"));
    if (result.statusCode == 200) {
      final data = Restoranlist.fromjson(jsonDecode(result.body));
      Logger().d(data.restoran);
      return data;
    } else {
      throw Exception("terjadi kesalahan");
    }
  }

  Future<RestorainDetil> getRestoranDetail(String id) async {
    final result = await http.get(Uri.parse("${Constant.url}/detail/$id"));

    if (result.statusCode == 200) {
      final data = RestorainDetil.fromjson(jsonDecode(result.body));
      return data;
    } else {
      throw Exception("terjadi kesalahan");
    }
  }
}
