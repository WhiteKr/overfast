import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/language_bloc.dart';
import '../../model/language.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        if (state is! LanguageLoaded) return const SizedBox();

        return PopupMenuButton<String>(
          icon: const Icon(Icons.language),
          initialValue: state.languageCode,
          onSelected: (String languageCode) {
            context.read<LanguageBloc>().add(ChangeLanguage(languageCode));
          },
          itemBuilder: (BuildContext context) {
            return Language.supportedLanguages
                .map(
                  (language) => PopupMenuItem<String>(
                    value: language.code,
                    child: Text(language.name),
                  ),
                )
                .toList();
          },
        );
      },
    );
  }
}
