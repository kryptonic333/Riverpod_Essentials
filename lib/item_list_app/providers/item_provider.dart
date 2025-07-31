import 'package:riverpod/riverpod.dart';
import 'package:riverpod_tutorial/item_list_app/models/item_model.dart';

final itemProvider = StateNotifierProvider<ItemNotifier, List<Item>>((ref) {
  return ItemNotifier();
});

class ItemNotifier extends StateNotifier<List<Item>> {
  ItemNotifier() : super([]);

  void addItem(String name) {
    final newItem = Item(id: DateTime.now().toString(), name: name);
    state.add(newItem);
    state = state.toList();
  }
  void removeItem(String id) {
    // Item with matched id will be removed from the list and thrown in garbage collection.
    state = state.where((item) => item.id != id).toList();

    // Alternatively, you can use the following line to remove the item:
    // state.removeWhere((item) => item.id == id);
    // sate = state.toList();
  }

  void editItem(String id, String newName) {
    // Find the index of the item to be edited
    final index = state.indexWhere((item) => item.id == id);
    if (index != -1) {
      // Create a new item with the updated name
      final updatedItem = Item(id: id, name: newName);
      // Replace the old item with the updated one
      state[index] = updatedItem;
      // Update the state to reflect the changes
      state = state.toList();
    }
  }




}
