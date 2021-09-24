import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class IncrementNotifier extends ChangeNotifier {
  int _value = 0;
  int get value => _value;

  void increment() {
    _value++;
    notifyListeners();
  }
}

final incrementProvider = ChangeNotifierProvider((ref) => IncrementNotifier());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Tutorial',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RiverPod Tutorial'),
        ),
        body: Center(
          child: Consumer(builder: (context, watch, child) {
            final incrementNotifier = watch(incrementProvider);
            return Text(incrementNotifier.value.toString());
          }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read(incrementProvider).increment();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
