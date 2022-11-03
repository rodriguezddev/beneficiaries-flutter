import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

import '../../constants/constants.dart';
import '../../utils/utils.dart';
import '../../models/user/bamba_user.dart';
import '../../utils/base_status.dart';
import '../../repositories/customer_repository.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final repository = CustomerRepository();
  CustomerBloc() : super(const CustomerState()) {
    on<GetCustomerEvent>(_mapGetCustomerEvent);
  }

  Future<void> _mapGetCustomerEvent(
    GetCustomerEvent event,
    Emitter<CustomerState> emit,
  ) async {
    emit(
      state.copyWith(status: BaseStatus.onRequest),
    );

    try {
      String token = Utils.getToken();
      String customerId = event.customerId ?? '';

    final response = await repository!.getCustomer(token, customerId);
    BambaUser bambaUser = (response);
      Utils.savePointsPrefs(bambaUser!);
      emit(
        state.copyWith(status: BaseStatus.success,
        user: bambaUser),
      );
    } on DioError catch (error) {
      _onDioError(error);
    } catch (error) {
      emit(
        state.copyWith(
          status: BaseStatus.failed,
          onErrorMessage: Constants.userErrorText,
        ),
      );
    }
  }

  String _onDioError(DioError error) {
    String errorMessage = '';
    switch (error.response?.statusCode) {
      case 400:
      case 404:
      case 405:
        errorMessage = error.response!.data[Constants.errorText];
        break;
      case 401:
        //TODO:  implement logout or refresh token
        errorMessage = error.response!.data[Constants.errorText];
        break;
      case 422:
        errorMessage =
            error.response!.data[Constants.userErrorText];
        break;
      default:
        errorMessage = error.message;
        break;
    }

    return errorMessage;
  }
}
