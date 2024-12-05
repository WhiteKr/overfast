import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../config/env_config.dart';
import '../model/hero.dart';

class HeroesRepository {
  Future<List<Hero>> getHeroes() async {
    final response = await http.get(Uri.parse('${EnvConfig.apiUrl}/heroes'));

    if (response.statusCode == 200) {
      final List<dynamic> heroesJson = json.decode(response.body);
      return heroesJson.map((json) => Hero.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load heroes');
    }
  }
}
