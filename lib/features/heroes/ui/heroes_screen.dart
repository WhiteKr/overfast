import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/heroes_bloc.dart';
import '../data/heroes_repository.dart';

class HeroesScreen extends StatelessWidget {
  const HeroesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HeroesBloc(HeroesRepository())..add(LoadHeroes()),
      child: BlocBuilder<HeroesBloc, HeroesState>(
        builder: (context, state) {
          if (state is HeroesLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HeroesError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          if (state is HeroesLoaded) {
            return ListView.builder(
              itemCount: state.heroes.length,
              itemBuilder: (context, index) {
                final hero = state.heroes[index];
                return ListTile(
                  leading: Image.network(
                    hero.portrait,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(hero.name),
                  subtitle: Text('Role: ${hero.role.name}'),
                );
              },
            );
          }
          return const Center(child: Text('No heroes found'));
        },
      ),
    );
  }
}
