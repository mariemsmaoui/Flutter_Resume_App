import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ThemeEvent { toggle }

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(_lightTheme);

  static final _lightTheme = ThemeData.light();
  static final _darkTheme = ThemeData.dark();

  @override
  Stream<ThemeData> mapEventToState(ThemeEvent event) async* {
    switch (event) {
      case ThemeEvent.toggle:
        yield state == _lightTheme ? _darkTheme : _lightTheme;
        break;
    }
  }
}
