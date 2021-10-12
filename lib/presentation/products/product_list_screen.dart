import 'package:flutter/material.dart';
import 'package:flutter_riverpod/domain/products/product.dart' as p;
import 'package:flutter_riverpod/presentation/products/product.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Widget> items = [
    Product(
      item: p.Product(
        title: 'Iphone',
        description:
            'Voluptua diam at duo amet sit magna sadipscing ipsum, sit invidunt consetetur voluptua no diam, sed ea amet kasd invidunt.',
        price: 1250,
      ),
    ),
    Product(
      item: p.Product(
        title: 'Macbook',
        description:
            'Voluptua diam at duo amet sit magna sadipscing ipsum, sit invidunt consetetur voluptua no diam, sed ea amet kasd invidunt.',
        price: 1899,
      ),
    ),
    Product(
      item: p.Product(
        title: 'Notebook',
        description:
            'Voluptua diam at duo amet sit magna sadipscing ipsum, sit invidunt consetetur voluptua no diam, sed ea amet kasd invidunt.',
        price: 759,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return items[index];
          },
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
