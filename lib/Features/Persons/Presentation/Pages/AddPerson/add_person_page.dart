import 'package:bktest/Features/Persons/Domain/Entities/person.dart';
import 'package:bktest/Features/Persons/Presentation/Providers/AddPerson/add_person_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final TextEditingController nameController = TextEditingController();
final TextEditingController addressController = TextEditingController();
final TextEditingController emailController = TextEditingController();

class AddPerson extends ConsumerStatefulWidget {
  const AddPerson({Key? key}) : super(key: key);

  @override
  ConsumerState<AddPerson> createState() => _AddPersonState();
}

class _AddPersonState extends ConsumerState<AddPerson> {
  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test App : Add Person'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              // TextFormField(
              //   enabled: false,
              //   initialValue: id.toString(),
              //   textAlign: TextAlign.center,
              //   decoration: const InputDecoration(
              //     icon: Icon(Icons.key),
              //     disabledBorder: OutlineInputBorder(),
              //     border: OutlineInputBorder(),
              //   ),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              TextFormField(
                controller: nameController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  disabledBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.person),
                  hintText: 'Name',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: addressController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  disabledBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.home),
                  hintText: 'Address',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  disabledBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.email),
                  hintText: 'Email',
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .read(addPersonProvider)
              .addPerson(Person(
                id: id.toString(),
                name: nameController.text,
                email: emailController.text,
                address: addressController.text,
              ))
              .then((value) {
            nameController.clear();
            addressController.clear();
            emailController.clear();
            Navigator.of(context).pop();
          });
        },
        child: const Center(
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
