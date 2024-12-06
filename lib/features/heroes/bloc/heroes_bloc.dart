import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/heroes_repository.dart';
import '../model/hero.dart';

// Events
abstract class HeroesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadHeroes extends HeroesEvent {}

// States
abstract class HeroesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HeroesInitial extends HeroesState {}

class HeroesLoading extends HeroesState {}

class HeroesLoaded extends HeroesState {
  final List<Hero> heroes;

  HeroesLoaded(this.heroes);

  @override
  List<Object?> get props => [heroes];
}

class HeroesError extends HeroesState {
  final String message;

  HeroesError(this.message);

  @override
  List<Object?> get props => [message];
}

// BLoC
class HeroesBloc extends Bloc<HeroesEvent, HeroesState> {
  final HeroesRepository _repository;

  HeroesBloc(this._repository) : super(HeroesInitial()) {
    on<LoadHeroes>((event, emit) async {
      emit(HeroesLoading());
      try {
        final heroes = await _repository.getHeroes();
        emit(HeroesLoaded(heroes));
      } catch (e) {
        emit(HeroesError(e.toString()));
      }
    });
  }
}
