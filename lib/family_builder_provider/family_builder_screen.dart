import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/family_builder_provider/family_builder_provider.dart';

Map<String, dynamic> map = {'id': 2, 'name': "Hello"};

class FamilyBuilderScreen extends ConsumerWidget {
  const FamilyBuilderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(multiplierProvider(map));
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Family Builder Screen',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        body: Center(child: Text('$result')));
  }
}
