import 'package:bktest/Features/Persons/Domain/Entities/person.dart';
import 'package:bktest/Features/Persons/Presentation/Providers/EditPerson/edit_person_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final TextEditingController nameController = TextEditingController();
final TextEditingController addressController = TextEditingController();
final TextEditingController emailController = TextEditingController();

class EditPerson extends ConsumerStatefulWidget {
  const EditPerson({Key? key}) : super(key: key);

  @override
  ConsumerState<EditPerson> createState() => _EditPersonState();
}

class _EditPersonState extends ConsumerState<EditPerson> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Person person = ModalRoute.of(context)!.settings.arguments as Person;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test App : Edit Person'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                enabled: false,
                initialValue: person.id.toString(),
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  icon: Icon(Icons.key),
                  disabledBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: person.name,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  disabledBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.person),
                  hintText: 'Name',
                ),
                onChanged: (val) {
                  ref.read(editPersonProvider).setPersonName(val);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: person.address,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  disabledBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.home),
                  hintText: 'Address',
                ),
                onChanged: (val) {
                  ref.read(editPersonProvider).setPersonAddress(val);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: person.email,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  disabledBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.email),
                  hintText: 'Email',
                ),
                onChanged: (val) {
                  ref.read(editPersonProvider).setPersonEmail(val);
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(editPersonProvider).editPerson(person).then((value) {
            Navigator.of(context).pop();
          });
        },
        child: const Center(
          child: Icon(Icons.edit),
        ),
      ),
    );
  }
}
