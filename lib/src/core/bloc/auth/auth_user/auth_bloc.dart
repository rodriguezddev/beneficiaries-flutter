import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../utils/base_status.dart';
import '../../../repositories/customer_repository.dart';
import '../../../models/bamba_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final serviceLocator = GetIt.instance;
  late CustomerRepository _customerRepository;

  AuthBloc(AuthState initialState) : super(initialState) {
    //_customerRepository = serviceLocator.get<CustomerRepository>();

    on<CheckIfIsLoggedInEvent>(_mapValidateLoggedUser);

    on<AddUserLoggedEvent>(_mapAddUserLoggedEventToState);

    on<LogoutEvent>(_mapOnLogOutEventToState);
  }

  void _mapAddUserLoggedEventToState(
      AddUserLoggedEvent event,
      Emitter<AuthState> emit,
      ) {
    emit(
      state.copyWith(
        status: BaseStatus.authenticated,
        user: event.user,
      ),
    );
  }

  void _mapOnLogOutEventToState(
      LogoutEvent event,
      Emitter<AuthState> emit,
      ) {
    emit(state.copyWith(status: BaseStatus.unauthenticated));
  }

  void _mapValidateLoggedUser(
      AuthEvent event,
      Emitter<AuthState> emit,
      ) async {
    emit(state.copyWith(status: BaseStatus.loading));

    final isLogged = true;//TODO: validate auth
    if (!isLogged) {
      emit(
        state.copyWith(
          status: BaseStatus.unauthenticated,
        ),
      );
      return;
    }

    final user = BambaUser();//TODO: Get user from utils
    user.email = 'miguel.osorio@vivebamba.com';
    user.name = 'Mike Test';
    user.bambaBalance = "100.00";

    emit(
      state.copyWith(
        status: BaseStatus.authenticated,
        user: user,
      ),
    );
  }
}
