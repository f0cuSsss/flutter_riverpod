import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/application/products/product_providers.dart';
import 'package:flutter_riverpod_demo/domain/products/product.dart' as p;
import 'package:flutter_riverpod_demo/infrastructure/products/product.dart';
import 'package:flutter_riverpod_demo/presentation/products/product.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Text('Future Provider'),
            Consumer(
              builder: (context, T Function<T>(ProviderBase<Object?, T>) watch,
                  child) {
                return watch(allProductsProvider).when(
                  data: (products) {
                    return Text(products.length.toString());
                  },
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                  error: (error, _) {
                    return Text('Error: $error');
                  },
                );
              },
            ),
            const Divider(),
            Consumer(builder: (context,
                T Function<T>(ProviderBase<Object?, T>) watch, child) {
              final value = watch(counterController).toString();
              return Text('Value: $value');
            }),
            ButtonBar(
              children: [
                ElevatedButton(
                  child: const Text('Add'),
                  onPressed: () {
                    context.read(counterController.notifier).add();
                    context.read(counterAsyncController.notifier).add();
                  },
                ),
                ElevatedButton(
                  child: const Text('Substract'),
                  onPressed: () {
                    context.read(counterController.notifier).subtract();
                    context.read(counterAsyncController.notifier).subtract();
                  },
                ),
              ],
            ),
            const Divider(),
            Consumer(
              builder: (context, T Function<T>(ProviderBase<Object?, T>) watch,
                  child) {
                return watch(counterAsyncController).when(
                  data: (value) {
                    return Text("AsyncValue: ${value.toString()}");
                  },
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                  error: (error, _) {
                    return Text('Error: $error');
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     body: SafeArea(
  //       child: CustomScrollView(
  //         slivers: <Widget>[
  //           const SliverAppBar(
  //             backgroundColor: Colors.white,
  //             pinned: false,
  //             snap: false,
  //             floating: true,
  //             // expandedHeight: 100.0,
  //             flexibleSpace: FlexibleSpaceBar(
  //               collapseMode: CollapseMode.pin,
  //               title: Text(
  //                 'Products',
  //                 style: TextStyle(
  //                   color: Colors.black,
  //                   fontWeight: FontWeight.w400,
  //                   letterSpacing: 2.0,
  //                 ),
  //               ),
  //               // titlePadding: EdgeInsetsDirectional.only(start: 72, bottom: 60),
  //             ),
  //           ),
  //           // SliverLayoutBuilder(
  //           //   builder: (context, constraints) {
  //           //     return GridView.count(
  //           //       crossAxisCount: 2,
  //           //       crossAxisSpacing: 10.0,
  //           //       mainAxisSpacing: 10.0,
  //           //       children: items,
  //           //     );
  //           //   },
  //           // ),
  //           SliverGrid.count(
  //             crossAxisCount: 2,
  //             crossAxisSpacing: 10.0,
  //             mainAxisSpacing: 10.0,
  //             children: items,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
