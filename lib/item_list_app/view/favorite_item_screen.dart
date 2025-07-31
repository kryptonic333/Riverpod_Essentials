import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/item_list_app/providers/favorite_provider.dart';

class FavoriteItemScreen extends ConsumerWidget {
  const FavoriteItemScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Using the favoriteProvider to watch the state of favorite items.
    final favoriteList = ref.watch(favoriteProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          // PopupMenuButton - contains options 'All' and 'Favorites'
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: Text('All'),
                onTap: () {
                  ref.read(favoriteProvider.notifier).favorite('All');
                },
              ),
              PopupMenuItem(
                child: Text('Favorites'),
                onTap: () {
                  ref.read(favoriteProvider.notifier).favorite('Favorites');
                },
              ),
            ];
          })
        ],
        // AppBar title
        title: const Text(
          'Favorite Items',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      // Body of the scaffold
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {
                ref.read(favoriteProvider.notifier).filterList(value);
              },
            ),
          ),

          // Item List
          Expanded(
              child: ListView.builder(
            itemCount: favoriteList.filteredItems.length,
            itemBuilder: (context, index) {
              final item = favoriteList.filteredItems[index];
              return ListTile(
                title: Text(item.name),
                trailing: IconButton(
                  icon: Icon(
                    item.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: item.isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {},
                ),
              );
            },
          ))
        ],
      ),

      // Floating action button to add items
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(favoriteProvider.notifier).addItem();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
