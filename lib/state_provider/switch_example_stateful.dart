import 'package:extensions_kit/extensions_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final switchNotifier = StateProvider<bool>((ref) {
  return false;
});

class SwitchExample2 extends ConsumerStatefulWidget {
  const SwitchExample2({super.key});

  @override
  ConsumerState<SwitchExample2> createState() => _SwitchExample2State();
}

class _SwitchExample2State extends ConsumerState<SwitchExample2> {
  // LifeCycle - The sequence of events a widget (especially `StatefulWidget`) goes through
  //from "creation to destruction". It includes methods like
  // `initState()`, `build()`, and `dispose()` to manage setup, UI rendering, and cleanup.

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(switchNotifier.notifier).state = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Switch_Example_2 (RP_SP)'),
      ),
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          final state = ref.watch(switchNotifier);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              context.w(2).widthBox,
              Padding(
                padding: const EdgeInsets.all(20),
                child: const Text(
                  'Switch Example with \n    stateful widget',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Switch(
                value: state,
                onChanged: (value) {
                  ref.read(switchNotifier.notifier).state = value;
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
