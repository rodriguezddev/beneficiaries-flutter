part of 'product_bloc.dart';

class ProductState extends Equatable{
  const ProductState({
    this.productStatus = BaseStatus.initialized,
    this.buyProductStatus = BaseStatus.initialized,
    this.cancelProductStatus = BaseStatus.initialized,
    this.onErrorMessage = '',
    this.products = const [],
    this.initialProducts = const [],
    this.myServices = const [],
  });
  
  final BaseStatus productStatus;
  final BaseStatus buyProductStatus;
  final BaseStatus cancelProductStatus;
  final List<Product> products;
  final List<Product> initialProducts;
  final List<BambaService> myServices;
  final String? onErrorMessage;
  

  ProductState copyWith({
    BaseStatus? productStatus,
    BaseStatus? buyProductStatus,
    BaseStatus? cancelProductStatus,
    List<Product>? products,
    List<Product>? initialProducts,
    List<BambaService>? myServices,
    String? onErrorMessage,
  }) { 
    return ProductState(
      productStatus: productStatus ?? this.productStatus,
      buyProductStatus: buyProductStatus ?? this.buyProductStatus,
      cancelProductStatus: cancelProductStatus ?? this.cancelProductStatus,
      onErrorMessage: onErrorMessage ?? this.onErrorMessage,
      products: products ?? this.products,
      initialProducts: initialProducts ?? this.initialProducts,
      myServices: myServices ?? this.myServices,
    );
  }

  @override
  List<Object?> get props => [
    productStatus,
    productStatus,
    buyProductStatus,
    cancelProductStatus,
    onErrorMessage,
    products,
    initialProducts,
    myServices,
  ];
}
