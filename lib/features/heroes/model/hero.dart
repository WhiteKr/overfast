import 'package:equatable/equatable.dart';

import 'hero_key.dart';
import 'role.dart';

class Hero extends Equatable {
  final HeroKey key;
  final String name;
  final String portrait;
  final Role role;

  const Hero({
    required this.key,
    required this.name,
    required this.portrait,
    required this.role,
  });

  factory Hero.fromJson(Map<String, dynamic> json) {
    return Hero(
      key: HeroKey.fromJson(json['key']),
      name: json['name'],
      portrait: json['portrait'],
      role: Role.values.firstWhere(
        (e) => e.name == json['role'],
        orElse: () => throw Exception('Unknown role: ${json['role']}'),
      ),
    );
  }

  @override
  List<Object?> get props => [key, name, portrait, role];
}
