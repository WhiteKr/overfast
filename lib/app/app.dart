import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:overfast/app/navigation/main_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/bloc/language_bloc.dart';
import '../shared/data/language_repository.dart';
import '../shared/model/language.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        return BlocProvider(
          create: (context) => LanguageBloc(
            LanguageRepository(snapshot.data!),
          )..add(LoadLanguage()),
          child: BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              final locale = state is LanguageLoaded
                  ? _localeFromString(state.languageCode)
                  : const Locale('en', 'US');

              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'OverFast',
                locale: locale,
                supportedLocales: Language.supportedLanguages
                    .map((lang) => _localeFromString(lang.code)),
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                home: const MainNavigation(),
              );
            },
          ),
        );
      },
    );
  }

  Locale _localeFromString(String code) {
    final parts = code.split('-');
    return Locale(parts[0], parts[1].toUpperCase());
  }
}
