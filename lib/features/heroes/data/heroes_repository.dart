import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../../config/env_config.dart';
import '../../../shared/bloc/language_bloc.dart';
import '../model/hero.dart' as hero_model;

class HeroesRepository {
  final BuildContext context;

  HeroesRepository(this.context);

  Future<List<hero_model.Hero>> getHeroes() async {
    final state = context.read<LanguageBloc>().state;
    final languageCode = state is LanguageLoaded ? state.languageCode : 'en-us';

    final response = await http.get(
      Uri.parse('${EnvConfig.apiUrl}/heroes').replace(
        queryParameters: {
          'locale': languageCode,
        },
      ),
    );

    if (response.statusCode == 200) {
      final List<dynamic> heroesJson = json.decode(response.body);
      return heroesJson.map((json) => hero_model.Hero.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load heroes');
    }
  }
}
