

import 'package:riverpod_tutorial/item_list_app/models/favorite_item_model.dart';

// This class represents the state of favorite items in the application.
class FavoriteState {
  // variables
  final List<FavoriteItem> allItems;
  final List<FavoriteItem> filteredItems;
  final String search;

  // constructor
  FavoriteState({required this.allItems, required this.filteredItems, required this.search});

  // copy_with method
  FavoriteState copyWith({List<FavoriteItem>? allItems, List<FavoriteItem>? filteredItems, String? search}) {
    return FavoriteState(
      allItems: allItems ?? this.allItems,
      filteredItems: filteredItems ?? this.filteredItems,
      search: search ?? this.search,
    );
  }

}