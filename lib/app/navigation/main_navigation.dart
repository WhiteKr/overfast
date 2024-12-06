import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../features/gamemodes/ui/gamemodes_screen.dart';
import '../../features/heroes/ui/heroes_screen.dart';
import '../../features/maps/ui/maps_screen.dart';
import '../../features/players/ui/players_screen.dart';
import '../../shared/ui/widgets/language_selector.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.appTitle),
          actions: const [LanguageSelector()],
          bottom: TabBar(
            tabs: [
              Tab(text: l10n.heroes),
              Tab(text: l10n.gamemodes),
              Tab(text: l10n.maps),
              Tab(text: l10n.players),
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
