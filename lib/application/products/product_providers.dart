import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/infrastructure/products/product.dart';
import 'package:flutter_riverpod_demo/domain/products/product.dart' as p;

//? user state for the app
final allProductsProvider =
    FutureProvider.autoDispose<List<p.Product>>((ref) async {
  return ref.read(productsProv).getProductsPart(10, 1);
});

//? counter state notifier for the app
final counterController = StateNotifierProvider((ref) => CounterNotifier());

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void add() {
    state = state + 1;
  }

  void subtract() {
    state = state - 1;
  }
}

//? async state notifier provider for state that doesn't change in real time
final counterAsyncController =
    StateNotifierProvider((ref) => CounterAsyncNotifier(ref.read));

class CounterAsyncNotifier extends StateNotifier<AsyncValue<int>> {
  CounterAsyncNotifier(this.read) : super(const AsyncLoading()) {
    _init();
  }

  final Reader read;

  void _init() async {
    //? Init something
    read(productsProv).initDatabase();
    state = const AsyncData(0);
  }

  void add() async {
    state = const AsyncLoading();
    int count = await read(productsProv).increment();
    state = AsyncData(count);
  }

  void subtract() async {
    state = const AsyncLoading();
    int count = await read(productsProv).decrement();
    state = AsyncData(count);
  }
}
