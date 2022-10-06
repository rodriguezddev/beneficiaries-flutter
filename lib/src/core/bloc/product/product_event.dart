part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class GetProducts extends ProductEvent {
  GetProducts();
}

class BuyProducts extends ProductEvent {
  final List<Product> productsToActive;

  BuyProducts({
    required this.productsToActive
  });
}

class GetServices extends ProductEvent {
  GetServices();
}

class CancelService extends ProductEvent {
  final BambaService bambaService;

  CancelService({
    required this.bambaService
  });
}
