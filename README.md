# 🌱 Riverpod Essentials – Flutter State Management Tutorial

Welcome to **Riverpod Essentials** – a hands-on Flutter project exploring Riverpod state management, based on this [YouTube tutorial series](https://www.youtube.com/playlist?list=PLFyjjoCMAPtwG6c3NYceuwmzSymRNAGHz).

Each module in this project demonstrates a different provider or Riverpod concept in its own folder for clarity and organization.

---

## 🚀 Topics Covered
<details> <summary>✅ <strong>SimpleProvider</strong></summary>
  ```
  final nameProvider = Provider((ref) => 'Mazhar');
  ref.watch(nameProvider); // Access value
  ```
</details>
<details> <summary>✅ <strong>StateProvider</strong> (Counter & Switch)</summary>
  ```
  final counterProvider = StateProvider((ref) => 0); 
  ref.watch(counterProvider);                  // Read value
  ref.read(counterProvider.notifier).state++;  // Update value
  ```
</details>
<details> <summary>✅ <strong>StateNotifierProvider</strong> (Search functionality)</summary>
  ```
 class SearchNotifier extends StateNotifier<String> {
  SearchNotifier() : super('');
  void update(String value) => state = value;
 } 

 final searchProvider = StateNotifierProvider<SearchNotifier, String>(
  (ref) => SearchNotifier(),
 );

 ref.watch(searchProvider);                    // Read state
 ref.read(searchProvider.notifier).update(''); // Update state
 ```   </details>
✅ FutureProvider  
✅ StreamProvider  
✅ Provider Family  
✅ Multiple Providers  
✅ ConsumerWidget & Consumer  
✅ Hooks (Optional in advanced examples)



---

## 🗂️ Folder Structure
```
lib/
├── 📁 family_builder_provider
│   ├── 📄 family_builder_provider.dart
│   └── 📄 family_builder_screen.dart
├── 📁 future_provider
│   ├── 📄 future_provider.dart
│   └── 📄 fp_screen.dart
├── 📁 item_list_app
│   ├── 📁 models
│   │   ├── 📄 favorite_item_model.dart
│   │   └── 📄 item_model.dart
│   ├── 📁 providers
│   │   ├── 📄 favorite_provider.dart
│   │   └── 📄 favorite_state.dart
│   └── 📁 view
│       ├── 📄 favorite_item_screen.dart
│       └── 📄 item_list_screen.dart
├── 📁 multiple_state_handling
│   ├── 📄 slider_provider.dart
│   └── 📄 slider_provider_screen.dart
├── 📁 simple_provider
│   └── 📄 simple_provider.dart
├── 📁 state_notifier_provider
│   ├── 📄 search_provider.dart
│   └── 📄 search_provider_screen.dart
├── 📁 state_provider
│   ├── 📄 counter_example.dart
│   ├── 📄 switch_example.dart
│   └── 📄 switch_example_stateful.dart
├── 📁 stream_provider
│   ├── 📄 stream_provider.dart
│   └── 📄 stream_provider_screen.dart
├── 📄 main.dart
└── 📄 option_screen.dart
```

