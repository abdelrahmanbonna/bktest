import 'dart:io';

String fixture(String name) =>
    File('test/Fixture/persons.json').readAsStringSync();
