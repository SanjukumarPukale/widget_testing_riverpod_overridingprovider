// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:widget_testing_riverpod_overridingprovider/model/model.dart';

class Repository {
  Future<List<Todo>> fetchTodos() async  => [Todo(id: '51', label: 'Sanjukumar', completed: true), 
  Todo(id: '61', label: 'Manjunath', completed: true),
  ];
}
