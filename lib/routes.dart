import 'package:fl_create/project/presentation/pages/create_project_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => CreateProjectPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Center(
            child: Text('Undefined Route!'),
          ),
        );
    }
  }
}
