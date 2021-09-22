import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

final greetingProvider = Provider((ref) => 'Hello RiverPod!!');

// ignore: use_key_in_widget_constructors
class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greeting = ref.watch(greetingProvider);

    return MaterialApp(
      title: 'Riverpod Tutorial',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RiverPod Tutorial'),
        ),
        body: Center(
          child: Text(greeting),
        ),
      ),
    );
  }
}
