import 'package:flutter_riverpod/flutter_riverpod.dart';

// Example 1
// final multiplierProvider = StateProvider.family<int,int>((ref, number) {
//   return number * 9;
// });

// Example 2
final multiplierProvider =
    StateProvider.family<int, Map<String, dynamic>>((ref, map) {
  return map['id'] * 3;
});
