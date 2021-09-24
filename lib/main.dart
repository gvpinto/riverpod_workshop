import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

final firstStringProvider = Provider((ref) => 'First');
final secondStringProvider = Provider((ref) => 'Second');

// ignore: use_key_in_widget_constructors
class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final first = watch(firstStringProvider);
    final second = watch(secondStringProvider);
    return MaterialApp(
      title: 'Riverpod Tutorial',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('RiverPod Tutorial'),
          ),
          body: Column(
            children: [
              Text(
                first,
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                second,
                style: const TextStyle(
                  fontSize: 30,
                ),
              )
            ],
          )),
    );
  }
}
