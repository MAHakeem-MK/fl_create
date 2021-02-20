import 'dart:io';
import 'package:fl_create/project/presentation/widgets/create_button.dart';
import 'package:fl_create/project/presentation/widgets/project_detail_field.dart';
import 'package:fl_create/templates/main_template.dart';
import 'package:fl_create/templates/pubspec_template.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CreateProjectPage extends StatelessWidget {
  final _appNameController = TextEditingController();
  final _organizationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: width * 0.5,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      "Create A Flutter Project",
                      style: _textTheme.headline5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ProjectDetailTextField(
                      controller: _appNameController,
                      label: 'App Name',
                      hint: 'My Cool App',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ProjectDetailTextField(
                      controller: _organizationController,
                      label: 'Organisation Name',
                      hint: 'Google',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: CreateButton(
                      onPressed: () async {
                        String path = "";
                        await getDownloadsDirectory()
                            .then((value) => path = value!.path);
                        await Directory('$path/${_appNameController.text}')
                            .create(recursive: true);
                        await File(
                                '$path/${_appNameController.text}/pubspec.yaml')
                            .writeAsString(getPubspec(_appNameController.text));
                        await Directory('$path/${_appNameController.text}/lib')
                            .create(recursive: true);
                        await File(
                                '$path/${_appNameController.text}/lib/main.dart')
                            .writeAsString(getMain());

                        await Process.run(
                          "flutter",
                          ['create', '.'],
                          workingDirectory: '$path/${_appNameController.text}',
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
