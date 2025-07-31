
import 'package:riverpod/riverpod.dart';

/*  
 Create a StateNotifierProvider called `searchProvider`
 This provider gives access to both the current state (a String) and the logic in SearchNotifier.
 - The first type is the Notifier class (SearchNotifier).
 - The second type is the state it holds (String in this case).
*/

final searchProvider = StateNotifierProvider<SearchNotifier, SearchState>((ref) {
 
  return SearchNotifier();
});

//  Create a StateNotifier class that manages a piece of state.

class SearchNotifier extends StateNotifier<SearchState> {
  
  SearchNotifier() : super(SearchState(search: '',isChanged: false));

 
  void search(String query) {

    state = state.copyWith(search: query);
  }
  void onChange(bool isChanged) {

    state = state.copyWith(isChanged: isChanged);
  }
}

// Creating a class 
class SearchState {
  final String search;
  final bool isChanged;

  // Constructor 
  SearchState({
    required this.search,
    required this.isChanged,
  });

  // copy_with method
  SearchState copyWith({
    String? search,
    bool? isChanged,
  }) {
    return SearchState(
      search: search ?? this.search,
      isChanged: isChanged ?? this.isChanged,
    );
  }
}