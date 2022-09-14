import 'package:bktest/Core/Config/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 9, 78, 134),
        secondaryHeaderColor: const Color.fromARGB(255, 156, 0, 0),
      ),
      onGenerateRoute: Routes.generateRoute,
      initialRoute: RouteNames.initial,
    );
  }
}

