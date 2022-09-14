import 'package:bktest/Features/Persons/Presentation/Pages/AddPerson/add_person_page.dart';
import 'package:bktest/Features/Persons/Presentation/Pages/EditPerson/edit_person_page.dart';
import 'package:bktest/Features/Persons/Presentation/Pages/Home/home_page.dart';
import 'package:flutter/material.dart';


/// Holds all the routes in the app
class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.initial:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const Home(), settings: settings);
      case RouteNames.addPerson:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const AddPerson(), settings: settings);
      case RouteNames.editPerson:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const EditPerson(), settings: settings);
      default:
        return MaterialPageRoute<dynamic>(
            builder: (_) => const Home(), settings: settings);
    }
  }
}

/// Holds all the route names which used to navigate in the app
class RouteNames {
  static const String initial = '/';
  static const String addPerson = '/add';
  static const String editPerson = '/edit';
}
