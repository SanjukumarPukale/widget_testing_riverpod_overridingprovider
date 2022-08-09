import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_testing_riverpod_overridingprovider/repository/repository.dart';

final repositoryProvider = Provider((ref) => Repository());

final todoListProvider = FutureProvider((ref) {
  final repository = ref.read(repositoryProvider);
  return repository.fetchTodos();
},);