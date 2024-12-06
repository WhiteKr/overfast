enum HeroKey {
  ana,
  ashe,
  baptiste,
  bastion,
  brigitte,
  cassidy,
  dva,
  doomfist,
  echo,
  genji,
  hazard,
  hanzo,
  illari,
  junkerQueen,
  junkrat,
  juno,
  kiriko,
  lifeweaver,
  lucio,
  mauga,
  mei,
  mercy,
  moira,
  orisa,
  pharah,
  ramattra,
  reaper,
  reinhardt,
  roadhog,
  sigma,
  sojourn,
  soldier76,
  sombra,
  symmetra,
  torbjorn,
  tracer,
  venture,
  widowmaker,
  winston,
  wreckingBall,
  zarya,
  zenyatta;

  static HeroKey fromJson(String value) {
    switch (value) {
      case 'junker-queen':
        return HeroKey.junkerQueen;
      case 'soldier-76':
        return HeroKey.soldier76;
      case 'wrecking-ball':
        return HeroKey.wreckingBall;
      default:
        return HeroKey.values.firstWhere(
          (e) => e.name == value,
          orElse: () => throw Exception('Unknown hero key: $value'),
        );
    }
  }

  String toJson() {
    switch (this) {
      case HeroKey.junkerQueen:
        return 'junker-queen';
      case HeroKey.soldier76:
        return 'soldier-76';
      case HeroKey.wreckingBall:
        return 'wrecking-ball';
      default:
        return name;
    }
  }
}
