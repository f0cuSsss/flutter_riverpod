import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_demo/domain/products/product.dart' as p;

final productsProv = Provider<Product>((ref) => Product());

class Product {
  late int fakeDatabase;

  Future<void> initDatabase() async {
    fakeDatabase = 0;
  }

  Future<int> increment() async {
    return Future.delayed(const Duration(milliseconds: 500), () {
      return fakeDatabase = fakeDatabase + 1;
    });
  }

  Future<int> decrement() async {
    return Future.delayed(const Duration(milliseconds: 500), () {
      return fakeDatabase = fakeDatabase - 1;
    });
  }

  Future<List<p.Product>> getProductsPart(int count, int page) {
    return Future.delayed(const Duration(seconds: 3), () {
      return [
        p.Product(
          title: 'Iphone',
          description:
              'Voluptua diam at duo amet sit magna sadipscing ipsum, sit invidunt consetetur voluptua no diam, sed ea amet kasd invidunt.',
          price: 1250,
        ),
        p.Product(
          title: 'Macbook',
          description:
              'Voluptua diam at duo amet sit magna sadipscing ipsum, sit invidunt consetetur voluptua no diam, sed ea amet kasd invidunt.',
          price: 1899,
        ),
        p.Product(
          title: 'Notebook',
          description:
              'Voluptua diam at duo amet sit magna sadipscing ipsum, sit invidunt consetetur voluptua no diam, sed ea amet kasd invidunt.',
          price: 759,
        ),
      ];
    });
  }
}
