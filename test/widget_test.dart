// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:widget_testing_riverpod_overridingprovider/main.dart';
import 'package:widget_testing_riverpod_overridingprovider/model/model.dart';
import 'package:widget_testing_riverpod_overridingprovider/provider/provider.dart';
import 'package:widget_testing_riverpod_overridingprovider/repository/repository.dart';
import 'package:widget_testing_riverpod_overridingprovider/widget/todo_item.dart';

class FakeRepository implements Repository {
  @override
  Future<List<Todo>> fetchTodos() async {
    return [Todo(id: '21', label: 'Hello Sanju', completed: false)];
  }

}

void main() {
  testWidgets(
    'Override repositoryProvider',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            repositoryProvider.overrideWithValue(FakeRepository())
          ],
          child: const MyApp(),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsNothing);

      expect(tester.widgetList(find.byType(TodoItem)), [
        isA<TodoItem>()
              .having((s) => s.todo.id, 'todo.id', '21')
              .having((s) => s.todo.label, 's.todo.label', 'Hello Sanju')
              .having((s) => s.todo.completed, 's.todo.completed', false),
      ]);
    },
  );
}
