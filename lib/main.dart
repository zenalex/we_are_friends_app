// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nsg_controls/nsg_controls.dart';
import 'package:nsg_data/nsg_data.dart';
import 'app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NsgDataControllerMode.defaultDataControllerMode =
        const NsgDataControllerMode(storageType: NsgDataStorageType.local);
    return MaterialApp.router(
      //TODO: default transition
      //defaultTransition: Transition.rightToLeftWithFade,
      title: 'Мы - друзья',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontSize: 14.0,
            color: ControlOptions.instance.colorText,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            height: 1.20,
          ),
          bodyMedium: TextStyle(
            fontSize: 14.0,
            color: ControlOptions.instance.colorText,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            height: 1.20,
          ),
          displayLarge: TextStyle(
            fontSize: 20.0,
            color: ControlOptions.instance.colorText,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
          ),
          displayMedium: TextStyle(
            fontSize: 18.0,
            color: ControlOptions.instance.colorText,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            height: 1.40,
            letterSpacing: 1.0,
          ),
          displaySmall: TextStyle(
            fontSize: 18.0,
            color: ControlOptions.instance.colorText,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.normal,
          ),
          headlineMedium: TextStyle(
            fontSize: 14.0,
            color: ControlOptions.instance.colorText,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.normal,
          ),
          labelLarge: const TextStyle(
            fontSize: 14.0,
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.normal,
            height: 1.40,
            letterSpacing: 1.0,
          ),
          bodySmall: const TextStyle(
            fontSize: 14.0,
            color: Color.fromRGBO(33, 32, 30, 1),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            height: 1.40,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: AppPages.router,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ru')],
      locale: const Locale('ru'),
    );
  }
}
