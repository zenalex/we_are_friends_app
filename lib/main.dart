import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nsg_controls/nsg_controls.dart';
import 'app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      textDirection: TextDirection.ltr,
      defaultTransition: Transition.rightToLeftWithFade,
      title: 'Титан Контроль',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 14.0,
            color: ControlOptions.instance.colorText,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            height: 1.20,
          ),
          bodyText2: TextStyle(
            fontSize: 14.0,
            color: ControlOptions.instance.colorText,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            height: 1.20,
          ),
          headline1: TextStyle(
            fontSize: 20.0,
            color: ControlOptions.instance.colorText,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
          ),
          headline2: TextStyle(
            fontSize: 18.0,
            color: ControlOptions.instance.colorText,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            height: 1.40,
            letterSpacing: 1.0,
          ),
          headline3: TextStyle(
            fontSize: 18.0,
            color: ControlOptions.instance.colorText,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.normal,
          ),
          headline4: TextStyle(
            fontSize: 14.0,
            color: ControlOptions.instance.colorText,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.normal,
          ),
          button: const TextStyle(
            fontSize: 14.0,
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.normal,
            height: 1.40,
            letterSpacing: 1.0,
          ),
          caption: const TextStyle(
            fontSize: 14.0,
            color: Color.fromRGBO(33, 32, 30, 1),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            height: 1.40,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
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
