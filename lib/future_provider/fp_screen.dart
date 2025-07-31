import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/future_provider/future_provider.dart';

class FpScreen extends ConsumerWidget {
  const FpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider Example'),
        centerTitle: true,
      ),
      body: Center(
        child: provider.when(
          skipLoadingOnRefresh: false,
          data: (value) => ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  'Value: ${value[index]}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.invalidate(futureProvider); // Refresh the provider
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
