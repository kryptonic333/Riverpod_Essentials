import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProvider = FutureProvider<List<String>>((ref) async {
  // Simulate a network call or some asynchronous operation
  await Future.delayed(const Duration(seconds: 2));
  return ['Item 1', 'Item 2', 'Item 3']; // Example value
});
