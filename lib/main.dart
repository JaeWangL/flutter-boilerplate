import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/configs/index.dart';
import 'package:flutter_boilerplate/services/navigation/index.dart';
import 'package:flutter_boilerplate/styles/index.dart';
import 'di.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await di.loadDiModules();

  runApp(EasyLocalization(
      supportedLocales: appLocaleList.map((e) => e.locale).toList(),
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  final NavigationService _navigationSvc =
      di.serviceLocator.get<NavigationService>();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Boilerplate',
      initialRoute: _navigationSvc.initialRoute,
      routes: _navigationSvc.initializeNavigationRoutes(
        context,
        onToggleTheme: () {},
      ),
      theme: lightTheme,
    );
  }
}
