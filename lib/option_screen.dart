import 'package:flutter/material.dart';
import 'package:riverpod_tutorial/family_builder_provider/family_builder_screen.dart';
import 'package:riverpod_tutorial/future_provider/fp_screen.dart';
import 'package:riverpod_tutorial/get_api_future_provider/post_screen.dart';
import 'package:riverpod_tutorial/item_list_app/view/favorite_item_screen.dart';
import 'package:riverpod_tutorial/item_list_app/view/item_list_screen.dart';
import 'package:riverpod_tutorial/multiple_state_handling/slider_provider_screen.dart';
import 'package:riverpod_tutorial/simple_provider/simple_provider.dart';
import 'package:riverpod_tutorial/state_notifier_provider/search_provider_screen.dart';
import 'package:riverpod_tutorial/state_provider/counter_example.dart';
import 'package:riverpod_tutorial/state_provider/switch_example.dart';
import 'package:riverpod_tutorial/state_provider/switch_example_stateful.dart';
import 'package:riverpod_tutorial/stream_provider/stream_provider_screen.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Screen Options',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          // Simple Provider Screen
          Card(
            child: ListTile(
              trailing: const Icon(Icons.arrow_forward_ios),
              title: const Text('Simple Provider Example'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SimpleProvider();
                }));
              },
            ),
          ),

          // Switch Example Screen
          Card(
            child: ListTile(
              trailing: const Icon(Icons.arrow_forward_ios),
              title: const Text('State Provider Switch Example'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SwitchExample();
                }));
              },
            ),
          ),

          // Switch Example 2 -Stateful State Provider
          Card(
            child: ListTile(
              trailing: const Icon(Icons.arrow_forward_ios),
              title: const Text('State Provider Switch Example 2'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SwitchExample2();
                }));
              },
            ),
          ),

          //  Counter Example Screen
          Card(
            child: ListTile(
              trailing: const Icon(Icons.arrow_forward_ios),
              title: const Text('State Provider Counter Example'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CounterExample();
                }));
              },
            ),
          ),

          // State Notifier Provider
          Card(
            child: ListTile(
              trailing: const Icon(Icons.arrow_forward_ios),
              title: const Text('State Notifier Provider Example'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchProviderScreen();
                }));
              },
            ),
          ),

          // Multiple State Handling - Slider Example
          Card(
            child: ListTile(
              trailing: const Icon(Icons.arrow_forward_ios),
              title: const Text('State Notifier MSH(Slider) Example'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SliderProviderScreen();
                }));
              },
            ),
          ),

          // Item List Screen
          Card(
            child: ListTile(
              trailing: const Icon(Icons.arrow_forward_ios),
              title: const Text('Simple List App'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ItemListScreen();
                }));
              },
            ),
          ),

          // Favorite Item List Screen
          Card(
            child: ListTile(
              trailing: const Icon(Icons.arrow_forward_ios),
              title: const Text('Favorite Mobile App'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const FavoriteItemScreen();
                }));
              },
            ),
          ),
          // Future Provider Example
          Card(
            child: ListTile(
              trailing: const Icon(Icons.arrow_forward_ios),
              title: const Text('Future Provider Example'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const FpScreen();
                }));
              },
            ),
          ),
          // Stream Provider Example
          Card(
            child: ListTile(
              trailing: const Icon(Icons.arrow_forward_ios),
              title: const Text('Stream Provider Example'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const StreamProviderScreen();
                }));
              },
            ),
          ),
          // Get API x Future Provider Example
          Card(
            child: ListTile(
              trailing: const Icon(Icons.arrow_forward_ios),
              title: const Text('Get API x Future Provider'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const PostScreen();
                }));
              },
            ),
          ),
          // Family Builder Provider Example
          Card(
            child: ListTile(
              trailing: const Icon(Icons.arrow_forward_ios),
              title: const Text('Family Builder Provider'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const FamilyBuilderScreen();
                }));
              },
            ),
          ),
        ],
      ),
    );
  }
}
