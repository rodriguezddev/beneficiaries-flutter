import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constants.dart';
import '../../models/orders/order.dart';
import '../../models/orders/order_request.dart';
import '../../models/products/product.dart';
import '../../models/services/bamba_service.dart';
import '../../repositories/product_repository.dart';
import '../../utils/base_status.dart';
import '../../utils/utils.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final productRepository = ProductRepository();

  ProductBloc() : super(const ProductState()) {
    on<GetProducts>(_mapGetProductsEventToState);
    on<BuyProducts>(_mapBuyProductsEventToState);
    on<GetServices>(_mapGetServicesEventToState);
    on<CancelService>(_mapCancelServiceEventToState);
  }

  Future<void> _mapGetProductsEventToState(
    GetProducts event,
    Emitter<ProductState> emit,
  ) async {
    if (state.productStatus == BaseStatus.loading) {
      emit(state);

      return;
    }

    emit(
      state.copyWith(
        productStatus: BaseStatus.onRequest,
      ),
    );

    try {
      String? token = Utils.getToken();

      final response = await productRepository.getProducts(
        token: token,
      );

      emit(
        state.copyWith(
          products: response,
          initialProducts: List.unmodifiable(response),
          productStatus: BaseStatus.success,
          myServices: state.myServices
            .map(
              (bambaService) {
                state.products.removeWhere(
                  (element) => element.sku == bambaService.sku,
                );
              },
            )
            .cast<BambaService>()
            .toList(),
        ),
      );
    } on DioError catch (error) {
      String message = _onDioError(error);

      emit(
        state.copyWith(
          productStatus: BaseStatus.failed,
          onErrorMessage: message,
        ),
      );
    } catch (error) {
      String onErrorMessage = Constants.productErrorText;

      emit(
        state.copyWith(
          productStatus: BaseStatus.failed,
          onErrorMessage: onErrorMessage,
        ),
      );
    }
  }

  Future<void> _mapBuyProductsEventToState(
    BuyProducts event,
    Emitter<ProductState> emit,
  ) async {
    if (state.productStatus == BaseStatus.loading) {
      emit(state);

      return;
    }

    emit(
      state.copyWith(
        productStatus: BaseStatus.onRequest,
      ),
    );

    try {
      String? token = Utils.getToken();
      final userBamba = await Utils.getUser();

      if (userBamba == null) {
        return;
      }

      OrderRequest orderRequest = OrderRequest();
      PaymentParams paymentsParams = PaymentParams();

      paymentsParams.mediaTypeKey = Constants.mediaTypeKey;
      paymentsParams.mediaTypeValue = Constants.mediaTypeValue;

      orderRequest.customerId = userBamba.id;
      orderRequest.paymentParams = paymentsParams;
      orderRequest.products = event.productsToActive;

      await productRepository.buy(
        token: token,
        order: orderRequest.toJson(),
      );

      emit(
        state.copyWith(
          productStatus: BaseStatus.success,
          products: event.productsToActive
            .map(
              (product) {
                state.products.removeWhere(
                  (element) => element.sku == product.sku,
                );
              },
            )
            .cast<BambaService>()
            .toList(),
        ),
      );
    } on DioError catch (error) {
      String message = _onDioError(error);

      emit(
        state.copyWith(
          productStatus: BaseStatus.failed,
          onErrorMessage: message,
        ),
      );
    } catch (error) {
      String onErrorMessage = Constants.productErrorText;

      emit(
        state.copyWith(
          productStatus: BaseStatus.failed,
          onErrorMessage: onErrorMessage,
        ),
      );
    }
  }

  Future<void> _mapGetServicesEventToState(
    GetServices event,
    Emitter<ProductState> emit,
  ) async {
    List<Product>? removedProducts = state.products;

    if (state.productStatus == BaseStatus.loading) {
      emit(state);

      return;
    }

    emit(
      state.copyWith(
        productStatus: BaseStatus.onRequest,
      ),
    );

    try {
      String? token = Utils.getToken();
      final userBamba = await Utils.getUser();

      if (userBamba == null) {
        return;
      }

      final response = await productRepository.getServices(
        token: token,
        customerId: userBamba.id!,
      );

      emit(
        state.copyWith(
          myServices: _getMyServices(response),
          productStatus: BaseStatus.success,
        ),
      );

      for (var bambaService in state.myServices) {
        final product = state.initialProducts.firstWhereOrNull(
          (element) => bambaService.sku == element.sku,
        );

        if (product != null) {
          bambaService.slug = product.slug;
          bambaService.price = product.price;
          bambaService.image = product.image;
          bambaService.description = product.description;
          bambaService.terms = product.terms;
        }

        removedProducts.removeWhere(
          (element) => element.sku == bambaService.sku,
        );
      }

      emit(
        state.copyWith(
          products: removedProducts,
        ),
      );
    } on DioError catch (error) {
      String message = _onDioError(error);

      emit(
        state.copyWith(
          productStatus: BaseStatus.failed,
          onErrorMessage: message,
        ),
      );
    } catch (error) {
      String onErrorMessage = Constants.productErrorText;

      emit(
        state.copyWith(
          productStatus: BaseStatus.failed,
          onErrorMessage: onErrorMessage,
        ),
      );
    }
  }

  Future<void> _mapCancelServiceEventToState(
    CancelService event,
    Emitter<ProductState> emit,
  ) async {
    List<BambaService>? myServices;

    if (state.productStatus == BaseStatus.loading) {
      emit(state);

      return;
    }

    emit(
      state.copyWith(
        productStatus: BaseStatus.onRequest,
      ),
    );

    try {
      String? token = Utils.getToken();
      var skus = {
        'skus': event.bambaService.fromBundle ? [event.bambaService.sku] : []
      };
      final userBamba = await Utils.getUser();

      if (userBamba == null) {
        return;
      }

      await productRepository.cancelService(
        token: token,
        customerId: userBamba.id!,
        serviceId: event.bambaService.id!,
        body: skus,
      );

      myServices?.removeWhere(
        (element) => element.sku == event.bambaService.sku,
      );

      emit(
        state.copyWith(
          productStatus: BaseStatus.success,
          myServices: myServices,
        ),
      );
    } on DioError catch (error) {
      String message = _onDioError(error);

      emit(
        state.copyWith(
          productStatus: BaseStatus.failed,
          onErrorMessage: message,
        ),
      );
    } catch (error) {
      String onErrorMessage = Constants.productErrorText;

      emit(
        state.copyWith(
          productStatus: BaseStatus.failed,
          onErrorMessage: onErrorMessage,
        ),
      );
    }
  }

  String _onDioError(DioError error) {
    String errorMessage = '';

    switch (error.response?.statusCode) {
      case 400:
      case 401:
      case 404:
      case 405:
        errorMessage = error.response!.data[Constants.errorText];
        break;
      case 422:
        errorMessage =
          error.response!.data[Constants.fileErrorText];
        break;
      default:
        errorMessage = error.message;
        break;
    }

    return errorMessage;
  }

  List<BambaService> _getMyServices(List<BambaService> response) {
    final services = List<BambaService>.empty(growable: true);

    for (var service in response) {
      if (service.products?.length == 1) {
        services.add(service);
        continue;
      }

      BambaService bService = BambaService();
      service.products?.forEach(
        (product) {
          bService.name = product.name;
          bService.sku = product.sku;
          bService.id = service.id;
          bService.brief = service.brief;
          bService.state = service.state;
          bService.validFrom = service.validFrom;
          bService.validTo = service.validTo;
          bService.certificateLink = service.certificateLink;
          bService.products = [product];
          bService.fromBundle = true;

          services.add(bService);
        },
      );
    }
    return services;
  }
}
