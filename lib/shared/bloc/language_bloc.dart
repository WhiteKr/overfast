import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/language_repository.dart';

// Events
abstract class LanguageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadLanguage extends LanguageEvent {}

class ChangeLanguage extends LanguageEvent {
  final String languageCode;

  ChangeLanguage(this.languageCode);

  @override
  List<Object> get props => [languageCode];
}

// States
abstract class LanguageState extends Equatable {
  @override
  List<Object> get props => [];
}

class LanguageInitial extends LanguageState {}

class LanguageLoaded extends LanguageState {
  final String languageCode;

  LanguageLoaded(this.languageCode);

  @override
  List<Object> get props => [languageCode];
}

// Bloc
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final LanguageRepository _repository;

  LanguageBloc(this._repository) : super(LanguageInitial()) {
    on<LoadLanguage>((event, emit) async {
      final languageCode = await _repository.getLanguage();
      emit(LanguageLoaded(languageCode));
    });

    on<ChangeLanguage>((event, emit) async {
      await _repository.setLanguage(event.languageCode);
      emit(LanguageLoaded(event.languageCode));
    });
  }
}
