import 'package:flutter/material.dart';
import 'package:fl_create/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FL Create',
      themeMode: ThemeMode.system,
      theme: ThemeData.light().copyWith(primaryColor: Colors.blue),
      darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.blueGrey),
      onGenerateRoute: Routes.onGenerateRoutes,
    );
  }
}
