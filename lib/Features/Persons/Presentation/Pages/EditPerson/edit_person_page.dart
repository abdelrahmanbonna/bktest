import 'package:flutter/material.dart';

class EditPerson extends StatefulWidget {
  const EditPerson({Key? key}) : super(key: key);

  @override
  State<EditPerson> createState() => _EditPersonState();
}

class _EditPersonState extends State<EditPerson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test App : Edit Person'),
      ),
      body: SafeArea(
        child: Column(
    
        ),
      ),
    );
  }
}