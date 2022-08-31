import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

import '../../repositories/customer_repository.dart';
import '../../repositories/product_repository.dart';
import '../../models/bamba_user.dart';
import '../../models/products/product.dart';
import '../../models/bamba_service.dart';
import '../../utils/base_status.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final serviceLocator = GetIt.instance;
  late CustomerRepository _customerRepository;
  late ProductRepository _productRepository;

  ProfileBloc() : super(const ProfileState()) {
    //_customerRepository = serviceLocator.get<CustomerRepository>();
    //_productRepository = serviceLocator.get<ProductRepository>();

    on<GetProfileEvent>(_mapGetProfileEventToState);

    on<EditProfileEvent>(_mapEditProfileEventToState);
  }

  Future<void> _mapEditProfileEventToState(
    EditProfileEvent event,
    Emitter<ProfileState> emit,
  ) async  {
    print(event.userId);
    emit(state.copyWith(status: BaseStatus.loading));
    await  Future.delayed(Duration(seconds: 5));
    final user = BambaUser();
    user.name = "Daniel";
    user.bambaBalance = "10.00";
    user.birthdate = DateTime.now().subtract(Duration(days: 10000),);
    emit(state.copyWith(status: BaseStatus.success, user: user));
  }

  void _mapGetProfileEventToState(
    GetProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    if (state.status == BaseStatus.loading) {
      emit(state);
      return;
    }

    emit(state.copyWith(status: BaseStatus.loading));

    try {
      String token = "token"; //TODO: get token from utils
      //TODO: finish the flow
      final user = BambaUser();
      user.name = "Mike";
      user.bambaBalance = "10.00";
      user.birthdate = DateTime.now().subtract(Duration(days: 365),);
      emit(
        state.copyWith(
          status: BaseStatus.success,
          user: user,
          myServices: [],
        ),
      );
    } on DioError catch (error) {
      String message = _onDioError(error);
      emit(state.copyWith(status: BaseStatus.failed, onErrorMessage: message));
    } catch (error) {
      String onErrorMessage = 'Ocurrió un error al obtener el usuario';
      emit(state.copyWith(
          status: BaseStatus.failed, onErrorMessage: onErrorMessage));
    }
  }

  String _onDioError(DioError error) {
    String errorMessage = '';
    switch (error.response?.statusCode) {
      case 400:
      case 404:
      case 405:
        errorMessage = error.response!.data['errors'];
        break;
      case 401:
        //TODO:  implement logout or refresh token
        errorMessage = error.response!.data['errors'];
        break;
      case 422:
        errorMessage =
            error.response!.data['ocurrio un error al obtener el usuario'];
        break;
      default:
        errorMessage = error.message;
        break;
    }

    return errorMessage;
  }
}
