import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:nsg_controls/localization/nsg_controls_localizations.dart';
import 'package:nsg_controls/nsg_controls.dart';
import 'package:nsg_data/nsg_data.dart';
import 'app_pages.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  GlobalKey<NavigatorState> mainKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    NsgDataControllerMode.defaultDataControllerMode =
        const NsgDataControllerMode(storageType: NsgDataStorageType.local);
    const MaterialColor white = MaterialColor(0xFFFFFFFF, <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    });
    mainKey = GlobalKey();
    return GetMaterialApp(
      builder: (BuildContext context, Widget? child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(
            //textScaleFactor: data.textScaleFactor > 1.2 ? 1.2 : data.textScaleFactor * 1.05,
            textScaleFactor: 1.0,
          ),
          child: child!,
        );
      },
      navigatorKey: mainKey,
      textDirection: TextDirection.ltr,
      defaultTransition: Transition.fadeIn,
      title: 'Мы - друзья',
      themeMode: ThemeMode.system,
      //themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: white,
        cupertinoOverrideTheme: CupertinoThemeData(
          textTheme: CupertinoTextThemeData(
            dateTimePickerTextStyle: TextStyle(color: nsgtheme.colorText),
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(),
        //scaffoldBackgroundColor: ControlOptions.instance.colorMainBack,
        scaffoldBackgroundColor: nsgtheme.colorMainBack,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: ControlOptions.instance.colorMainBack,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontSize: ControlOptions.instance.sizeM,
            color: ControlOptions.instance.colorText,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 1.20,
          ),
          bodyMedium: TextStyle(
            fontSize: ControlOptions.instance.sizeM,
            color: ControlOptions.instance.colorText,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 1.20,
          ),
          displayLarge: TextStyle(
            fontSize: 20.0,
            color: ControlOptions.instance.colorText,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
          displayMedium: TextStyle(
            fontSize: 18.0,
            color: ControlOptions.instance.colorText,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            height: 1.40,
            letterSpacing: 1.0,
          ),
          displaySmall: TextStyle(
            fontSize: 18.0,
            color: ControlOptions.instance.colorText,
            fontFamily: 'Inter',
            fontWeight: FontWeight.normal,
          ),
          headlineMedium: TextStyle(
            fontSize: ControlOptions.instance.sizeM,
            color: ControlOptions.instance.colorText,
            fontFamily: 'Inter',
            fontWeight: FontWeight.normal,
          ),
          labelLarge: TextStyle(
            fontSize: ControlOptions.instance.sizeM,
            color: ControlOptions.instance.colorText,
            fontFamily: 'Inter',
            fontWeight: FontWeight.normal,
            height: 1.40,
            letterSpacing: 1.0,
          ),
          bodySmall: TextStyle(
            fontSize: ControlOptions.instance.sizeM,
            color: ControlOptions.instance.colorText,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            height: 1.40,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      localizationsDelegates: const [
        //AppLocalizations.delegate,
        NsgControlsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[Locale('ru')],
      locale: const Locale('ru'),
      //  navigatorObservers: kIsWeb && kReleaseMode
      //       ? <NavigatorObserver>[observer!]
      //       : const <NavigatorObserver>[])
    );
  }
}
