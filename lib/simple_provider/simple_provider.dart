import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// A good practice to add datatype with provider for safety.
// to read value
final hello = Provider<String>((ref) {
  return 'John';
});

// to read value
final age = Provider<int>((ref) {
  return 25;
});


// ConsumerWidget for StatefulWidget
// ConsumerWidget - consumes values from a Provider.
// A reference to a Provider is  NOT passed to the ConsumerWidget when its a StatefulWidget.
class SimpleProvider extends ConsumerStatefulWidget {
  const SimpleProvider({super.key});

  @override
  ConsumerState<SimpleProvider> createState() => _SimpleProviderState();
}

class _SimpleProviderState extends ConsumerState<SimpleProvider> {
  @override
  Widget build(BuildContext context) {
    final name = ref.watch(hello);
    // ignore: non_constant_identifier_names
    final Age = ref.watch(age);
    return Scaffold(
      body: Center(
        child: Text(
          'Name: $name \n Age: $Age',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

// ConsumerWidget for StatelessWidget
// ConsumerWidget - consumes values from a Provider.
// A reference to a Provider is passed to the ConsumerWidget when its a StatelessWidget.
// class SimpleProvider extends ConsumerWidget {
//   const SimpleProvider({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // ref.watch() - Listen and rebuild on changes
//     final name = ref.watch(hello);
//     // ignore: non_constant_identifier_names
//     final Age = ref.watch(age);
//     return Scaffold(
//       body: Center(
//         child: Text(
//           'Name: $name \n Age: $Age',
//           style: TextStyle(fontSize: 30),
//         ),
//       ),
//     );
//   }
// }
