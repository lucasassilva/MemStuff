import 'package:flutter/material.dart';
import 'package:memstuff/core/app_theme_custom.dart';
import 'package:memstuff/helpers/service_locator.dart';
import 'core/app_const.dart';
import 'pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppTile,
      theme: theme(),
      home: HomePage(),
    );
  }
}
