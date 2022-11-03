import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/bloc/auth/auth_user/auth_bloc.dart';
import '../core/bloc/customer/customer_bloc.dart';
import '../core/bloc/product/product_bloc.dart';
import '../core/models/user/bamba_user.dart';

final bambaUser = BambaUser();

List<BlocProvider> providers =[
  ...dependentServices,
  ...uiConsumableProviders
];

List<BlocProvider> dependentServices = [
  BlocProvider<CustomerBloc>(
    create: (_) => CustomerBloc(),
  ),
  BlocProvider<ProductBloc>(
    create: (_) => ProductBloc(),
  ),
  BlocProvider<AuthBloc>(
    create: (_) => AuthBloc(
      AuthState(user: bambaUser)
    ),
  ),
];

List<BlocProvider> uiConsumableProviders = [];
