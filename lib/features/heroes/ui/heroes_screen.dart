import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../shared/bloc/language_bloc.dart';
import '../bloc/heroes_bloc.dart';
import '../data/heroes_repository.dart';
import '../model/hero.dart' as hero_model;
import 'widgets/hero_item.dart';

class HeroesScreen extends StatelessWidget {
  const HeroesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => HeroesBloc(
        HeroesRepository(context),
      )..add(LoadHeroes()),
      child: BlocConsumer<LanguageBloc, LanguageState>(
        listener: (context, languageState) {
          if (languageState is LanguageLoaded) {
            context.read<HeroesBloc>().add(LoadHeroes());
          }
        },
        builder: (context, languageState) {
          return BlocBuilder<HeroesBloc, HeroesState>(
            builder: (context, state) {
              if (state is HeroesLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is HeroesError) {
                return Center(child: Text(l10n.error(state.message)));
              }
              if (state is HeroesLoaded) {
                return ListView.builder(
                  itemCount: state.heroes.length,
                  itemBuilder: (context, index) {
                    final hero_model.Hero hero = state.heroes[index];
                    return HeroItem(hero: hero);
                  },
                );
              }
              return Center(child: Text(l10n.noHeroesFound));
            },
          );
        },
      ),
    );
  }
}
