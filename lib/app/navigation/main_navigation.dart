import 'package:flutter/material.dart';

import '../../features/gamemodes/ui/gamemodes_screen.dart';
import '../../features/heroes/ui/heroes_screen.dart';
import '../../features/maps/ui/maps_screen.dart';
import '../../features/players/ui/players_screen.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Overwatch Info'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Heroes'),
              Tab(text: 'Gamemodes'),
              Tab(text: 'Maps'),
              Tab(text: 'Players'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            HeroesScreen(),
            GamemodesScreen(),
            MapsScreen(),
            PlayersScreen(),
          ],
        ),
      ),
    );
  }
}
