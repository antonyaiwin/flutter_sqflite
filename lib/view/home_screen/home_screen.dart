import 'package:flutter/material.dart';
import 'package:flutter_sqflite/controller/home_screen_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await HomeScreenController.getAllData();
                  setState(() {});
                },
                child: const Text('get data'),
              ),
              ...List.generate(
                HomeScreenController.studentsList.length,
                (index) => ListTile(
                  title: Text(HomeScreenController.studentsList[index].name),
                  subtitle: Text(HomeScreenController
                      .studentsList[index].phoneNumber
                      .toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () async {
                          await HomeScreenController.editData(
                              HomeScreenController.studentsList[index].id);
                          setState(() {});
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () async {
                          await HomeScreenController.deleteData(
                              HomeScreenController.studentsList[index].id);
                          setState(() {});
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await HomeScreenController.addData();
          setState(() {});
        },
      ),
    );
  }
}
