import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/services/navigation/index.dart';
import 'package:flutter_boilerplate/styles/index.dart';
import 'di.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.loadDiModules();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final NavigationService _navigationSvc =
      di.serviceLocator.get<NavigationService>();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
