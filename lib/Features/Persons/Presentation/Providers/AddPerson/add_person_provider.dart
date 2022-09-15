import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPersonState extends ChangeNotifier {

}

final addPersonProvider = ChangeNotifierProvider<AddPersonState>((ref) {
  return AddPersonState();
});