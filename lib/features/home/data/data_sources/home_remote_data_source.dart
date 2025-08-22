import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mubasher_app/features/home/data/models/home_model.dart';

class HomeRemoteDataSource {
  final String baseUrl = "http://greenlinesr-001-site17.ltempurl.com/";

  Future<List<HomeModel>> fetchHomeData() async {
    final response = await http.get(Uri.parse("${baseUrl}api/home"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List list = data['datac'];
      return list.map((e) => HomeModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load data");
    }
  }
}
