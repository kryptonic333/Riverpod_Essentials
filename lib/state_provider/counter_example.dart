import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// A StateProvider allows you to hold and update simple values
// (like int, bool, String, etc.) that can change over time.
// Syntax
final counter = StateProvider<int>((ref) {
  return 0;
});

// Using StateProvider with StatelessWidget via Consumer
class CounterExample extends ConsumerWidget {
  const CounterExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print('FullBuild');
    // Every StateProvider gives you access to a notifier, which is the controller for its value.
    // Use ref.read() when performing actions like increment, reset, etc.
    // This controller has a .state property you can get or set.
    final state = ref.read(counter.notifier);

    // Without the consumer widget, whole widget tree will be rebuilt on every change.
    // To avoid this, wrap the widget whose value is changing with the Consumer widget.
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Counter App (RP_StateProvider)'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer(builder: (context, ref, child) {
                // print('build');
                // ref.watch() - Listen and rebuild on changes
                // ignore: non_constant_identifier_names
                final Counter = ref.watch(counter);
                return Text(
                  Counter.toString(),
                  style: const TextStyle(fontSize: 30),
                );
              }),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => state.state--,
                    child: const Text('Decrement'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () => state.state++,
                    child: const Text('Increment'),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
