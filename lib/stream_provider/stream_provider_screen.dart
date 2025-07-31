import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_tutorial/stream_provider/stream_provider.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider Example'),
        centerTitle: true,
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, index) {
            final provider = ref.watch(currentStockPrice);

            return provider.when(
              skipLoadingOnRefresh: false,
              data: (price) => Text(
                'Current Stock Price: \$${price.toStringAsFixed(2).toString()}',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              loading: () => const CircularProgressIndicator(),
              error: (error, stack) => Text('Error: $error'),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.invalidate(currentStockPrice); // Refresh the stream
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
