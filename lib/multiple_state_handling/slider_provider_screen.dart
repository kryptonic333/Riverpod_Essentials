/* 
Summary: Handling Multiple States in Riverpod
  
  In Riverpod, managing multiple UI states (like a slider value and a boolean toggle)
  within a single provider can be done by using a custom state class (e.g., SliderState),
  and updating individual fields using `.copyWith()` to maintain immutability.
  `.select( ) ` is used with `ref.watch()` to listen to only specific parts of the state,
  which helps in optimizing performance by avoiding unnecessary rebuilds. 
 
*/

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// This file contains the provider and model (like SliderState)
import 'package:riverpod_tutorial/multiple_state_handling/slider_provider.dart';

class SliderProviderScreen extends ConsumerWidget {
  const SliderProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple State Handling'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 👁‍🗨 Password Visibility Toggle Button
          Consumer(builder: (context, ref, child) {
            // For debugging: shows when this part rebuilds
            // uncomment the next line to see rebuilds
            // print('showPassword rebuild');

            // Only listens to `showPassword` field to avoid unnecessary rebuilds
            final slider = ref.watch(
              sliderProvider.select((state) => state.showPassword),
            );

            return IconButton(
              onPressed: () {
                // Read the current state (without listening)
                final currentState = ref.read(sliderProvider);

                // Update only the showPassword field, keeping other fields unchanged
                ref.read(sliderProvider.notifier).state = currentState.copyWith(
                    showPassword: !currentState.showPassword);
              },
              icon: slider
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
            );
          }),

          // Red Box with Dynamic Transparency
          Consumer(builder: (context, ref, child) {
            // For debugging: shows when this part rebuilds
            // uncomment the next line to see rebuilds
            // print('container rebuild');

            // Only listens to `slider` field to avoid unnecessary rebuilds
            final slider = ref.watch(
              sliderProvider.select((state) => state.slider),
            );

            return Container(
              height: 200,
              width: 200,
              // `.withAlpha()` expects int from 0 to 255 for transparency
              color: Colors.red.withValues(alpha: slider),
            );
          }),

          // 🎚 Slider to Control Transparency
          Consumer(builder: (context, ref, child) {
            // For debugging: shows when this part rebuilds
            // uncomment the next line to see rebuilds
            // print('slider rebuild');

            // Only listens to `slider` field
            final slider = ref.watch(
              sliderProvider.select((state) => state.slider),
            );

            return Slider(
              value: slider, // Current slider value
              onChanged: (value) {
                // Read current state
                final currentState = ref.read(sliderProvider);

                // Update only the `slider` value
                ref.read(sliderProvider.notifier).state =
                    currentState.copyWith(slider: value);
              },
            );
          }),
        ],
      ),
    );
  }
}
