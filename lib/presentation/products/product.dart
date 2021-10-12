import 'package:flutter/material.dart';
import 'package:flutter_riverpod/domain/products/product.dart' as p;

class Product extends StatelessWidget {
  const Product({
    Key? key,
    required this.item,
  }) : super(key: key);

  final p.Product item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      child: Center(child: Text(item.title)),
    );
  }
}
