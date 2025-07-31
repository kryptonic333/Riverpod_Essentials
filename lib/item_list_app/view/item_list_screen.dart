import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/item_list_app/providers/item_provider.dart';

class ItemListScreen extends ConsumerWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item List'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref
              .read(itemProvider.notifier)
              .addItem('New Item ${items.length + 1}');
        },
        child: const Icon(Icons.add),
      ),
      body: items.isEmpty
          ? const Center(
              child: Text('No items available'),
            )
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  leading: IconButton(
                      onPressed: () {
                        ref
                            .read(itemProvider.notifier)
                            .editItem(item.id, 'github: @Kryptonic333');
                      },
                      icon: Icon(Icons.edit)),
                  trailing: IconButton(
                      onPressed: () {
                        ref.read(itemProvider.notifier).removeItem(item.id);
                      },
                      icon: const Icon(Icons.delete)),
                  title: Text(item.name),
                );
              },
            ),
    );
  }
}
