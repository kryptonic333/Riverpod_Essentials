import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/item_list_app/models/favorite_item_model.dart';
import 'package:riverpod_tutorial/item_list_app/providers/favorite_state.dart';

// This provider manages the state of favorite items in the application.
// It allows adding items, filtering the list based on search queries,
final favoriteProvider =
    StateNotifierProvider<FavoriteNotifier, FavoriteState>((ref) {
  return FavoriteNotifier();
});

// Notifier class that extends StateNotifier to manage the state of favorite items.
// It provides methods to add items, filter the list, and manage favorite status.
class FavoriteNotifier extends StateNotifier<FavoriteState> {
  FavoriteNotifier()
      : super(FavoriteState(allItems: [], filteredItems: [], search: ''));

  // This method can be called to populate the initial list of favorite items.
  void addItem() {
    List<FavoriteItem> item = [
      FavoriteItem(id: '1', name: 'MacBook', isFavorite: true),
      FavoriteItem(id: '2', name: 'IPhone', isFavorite: false),
      FavoriteItem(id: '3', name: 'Samsung', isFavorite: true),
      FavoriteItem(id: '4', name: 'VIVO', isFavorite: false),
      FavoriteItem(id: '5', name: 'Google Pixel', isFavorite: false),
      FavoriteItem(id: '6', name: 'OnePlus', isFavorite: true),
    ];
    state =
        state.copyWith(allItems: item.toList(), filteredItems: item.toList());
  }

  // This method filters the list of favorite items based on the search query.
  void filterList(String query) {
    state = state.copyWith(
        filteredItems: _filteredItems(state.allItems, query), search: query);
  }

  // This method fetches the favorite items
  void favorite(String option) {
    state = state.copyWith(
        filteredItems: _favoriteItems(state.allItems, option), search: option);
  }

  // This method returns a list of favorite items based on the selected option.
  // If 'All' is selected, it returns all items; otherwise, it filters for favorites.
  List<FavoriteItem> _favoriteItems(List<FavoriteItem> item, String option) {
    if (option == 'All') {
      return item;
    } else {
      return item.where((item) => item.isFavorite == true).toList();
    }
  }

  // This  filters the list of items based on the search query.
  // It returns items that contain the search query in their name.
  List<FavoriteItem> _filteredItems(List<FavoriteItem> item, String query) {
    if (query.isEmpty) {
      return item;
    } else {
      return item
          .where(
              (item) => item.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}
