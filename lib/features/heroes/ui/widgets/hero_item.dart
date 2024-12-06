import 'package:flutter/material.dart';

import '../../model/hero.dart' as hero_model;

class HeroItem extends StatelessWidget {
  final hero_model.Hero hero;

  const HeroItem({
    super.key,
    required this.hero,
  });

  @override
  Widget build(BuildContext context) {
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
  }
}
