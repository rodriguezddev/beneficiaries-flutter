part of 'product_bloc.dart';

class ProductState extends Equatable{
  const ProductState({
    this.productStatus = BaseStatus.initialized,
    this.onErrorMessage = '',
    this.products = const [],
    this.initialProducts = const [],
    this.myServices = const [],
  });
  
  final BaseStatus productStatus;
  final List<Product> products;
  final List<Product> initialProducts;
  final List<BambaService> myServices;
  final String? onErrorMessage;
  

  ProductState copyWith({
    BaseStatus? productStatus,
    List<Product>? products,
    List<Product>? initialProducts,
    List<BambaService>? myServices,
    String? onErrorMessage,
  }) { 
    return ProductState(
      productStatus: productStatus ?? this.productStatus,
      onErrorMessage: onErrorMessage ?? this.onErrorMessage,
      products: products ?? this.products,
      initialProducts: initialProducts ?? this.initialProducts,
      myServices: myServices ?? this.myServices,
    );
  }

  @override
  List<Object?> get props => [
    productStatus,
    onErrorMessage,
    products,
    initialProducts,
    myServices,
  ];
}
