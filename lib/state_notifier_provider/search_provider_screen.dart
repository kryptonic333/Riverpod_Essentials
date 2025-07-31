import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/state_notifier_provider/search_provider.dart';

// This widget listens to Riverpod providers using ConsumerWidget
class SearchProviderScreen extends ConsumerWidget {
  const SearchProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref is used to read and watch providers

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Provider'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TextField for user input
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
              onChanged: (value) {
                // When user types, this method sends the value to the provider
                // `searchProvider.notifier` gives access to the notifier class
                ref.read(searchProvider.notifier).search(value);
              },
            ),
          ),

          // Display the current search query from provider
          Consumer(
            builder: (context, ref, child) {
              // Select just the search query field from the state
              final searchQuery =
                  ref.watch(searchProvider.select((state) => state.search));

              return Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child:
                    // Shows the latest query below the TextField
                    Text(
                  'Search Query: $searchQuery',
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
              );
            },
          ),

          // Switch
          Consumer(
            builder: (context, ref, child) {
              // Select just the isChanged boolean field from the state
              final boolCheck =
                  ref.watch(searchProvider.select((state) => state.isChanged));

              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Switch(
                  // Switch state (on/off)
                  value: boolCheck,
                  onChanged: (value) {
                    // Call a function in the notifier to update the boolean
                    ref.read(searchProvider.notifier).onChange(value);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
