import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bol = StateProvider<bool>((ref) {
  return false;
});

// StateProvider for Switch in StateLessWidget
class SwitchExample extends ConsumerWidget {
  const SwitchExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Switch Example (RP_StateProvider)'),
      ),
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          final state = ref.watch(bol);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: const Text(
                  'Switch Example with \n    stateless widget',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Switch(
                value: state,
                onChanged: (value) {
                  ref.read(bol.notifier).state = value;
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
