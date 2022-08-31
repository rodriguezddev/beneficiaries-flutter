import '../services/product_service.dart';

class ProductRepository {
  ProductRepository({required this.productService});
  final ProductService productService;
}