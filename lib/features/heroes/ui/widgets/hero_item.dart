import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../model/hero.dart' as hero_model;

class HeroItem extends StatelessWidget {
  final hero_model.Hero hero;

  const HeroItem({
    super.key,
    required this.hero,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ListTile(
      leading: Image.network(
        hero.portrait,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      title: Text(hero.name),
      subtitle: Text('${l10n.role}: ${hero.role.name}'),
    );
  }
}
