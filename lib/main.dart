import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_testing_riverpod_overridingprovider/provider/provider.dart';
import 'package:widget_testing_riverpod_overridingprovider/widget/todo_item.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final todos = ref.watch(todoListProvider);

          if (todos.asData == null) {
            return const CircularProgressIndicator();
          }
          return ListView(
            children: [
              for(final todo in todos.asData!.value) TodoItem(todo: todo)
            ],
          );
        },
      ),
    );
  }
}
