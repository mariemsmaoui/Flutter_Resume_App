import 'package:cv/core/theme/app_theme.dart';
import 'package:cv/pages/HomeScreen.dart';
import 'package:cv/pages/Infos.dart';
import 'package:cv/pages/Projects.dart';
import 'package:cv/screen/Splash_Animated.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:cv/pages/Education.dart';
import 'package:cv/core/theme/cubit/theme_cubit.dart';
import 'package:cv/core/theme/cubit/theme_cubit.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:cv/core/providers/drawer_provider.dart';
import 'package:cv/core/providers/scroll_provider.dart';
import 'package:cv/core/theme/cubit/theme_cubit.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(ResumeApp());
}

class ResumeApp extends StatelessWidget {
  ResumeApp({super.key});
  final routes = {
    '/education': (context) => Education(),
    '/infos': (context) => Infos(baseUrl: 'http://192.168.1.17:8000'),
    '/home': (context) => HomeScreen(),
    '/projects': (context) => Projects(),

    //'/': (context) => About(baseUrl: 'http://192.168.1.17:8000'),

  };
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        // BlocProvider<ConnectedBloc>(create: (context) => ConnectedBloc()),
      ],
      child: MultiProvider(
        providers: [
    //      ChangeNotifierProvider(create: (_) => DrawerProvider()),
          ChangeNotifierProvider(create: (_) => ScrollProvider()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
          return Sizer(builder: (context, orientation, deviceType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,

              theme: AppTheme.themeData(state.isDarkThemeOn, context),
              home: Splash_Animated(),

            );
          });
        }),
      ),
    );
  }
  }
