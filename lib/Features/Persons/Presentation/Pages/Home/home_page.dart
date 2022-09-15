import 'package:bktest/Core/Config/routes.dart';
import 'package:bktest/Features/Persons/Presentation/Providers/Home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ref.read(homeProvider).getAllPersons();
  }

  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(homeProvider);
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context);
    if (provider.error != null) {
      showTopSnackBar(
          context, CustomSnackBar.error(message: provider.error!.message));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test app: Home'),
        backgroundColor: theme.secondaryHeaderColor,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(RouteNames.addPerson,
                  arguments: provider.listOfPersons.length.toString());
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
          IconButton(
            onPressed: () {
              ref.read(homeProvider).getAllPersons();
            },
            icon: const Icon(
              Icons.refresh,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: provider.listOfPersons.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: theme.primaryColor,
              ),
              child: ListTile(
                textColor: Colors.white,
                iconColor: Colors.white,
                leading: Text(provider.listOfPersons[index].id),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(provider.listOfPersons[index].name),
                        Text(provider.listOfPersons[index].email),
                      ],
                    ),
                    SizedBox(
                      width: mediaQuery.size.width * 0.02,
                    ),
                    Text(provider.listOfPersons[index].address),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(RouteNames.editPerson,
                            arguments: provider.listOfPersons[index]);
                      },
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.edit,
                        size: 24,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        ref
                            .read(homeProvider)
                            .deletePerson(provider.listOfPersons[index]);
                      },
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.delete,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
