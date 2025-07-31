import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentStockPrice = StreamProvider<double>((ref) async* {
  final random = Random();
  double currentPrice = 100.0;

  while (true) {
    await Future.delayed(const Duration(seconds: 1)); // Update every second       
    // Simulate stock price changes
    currentPrice +=
        random.nextDouble() * 4 - 2; // Random change between -2 and +2
    yield double.parse(currentPrice.toStringAsFixed(2));
  }
});
