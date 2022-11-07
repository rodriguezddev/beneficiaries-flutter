import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../core/constants/constants.dart';
import '../../core/utils/utils.dart';
import '../../core/bloc/theme/theme_bloc.dart';
import '../../core/bloc/customer/customer_bloc.dart';
import '../../core/bloc/product/product_bloc.dart';
import '../../core/bloc/auth/auth_user/auth_bloc.dart';
import '../../core/constants/bamba_routes.dart';
import '../../core/utils/base_status.dart';
import '../kommons/bamba_layout.dart';
import '../kommons/screen_loading_logo.dart';
import 'components/profile_content.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileView createState() => _ProfileView();
}

class _ProfileView extends State<ProfileView> {
  ProductBloc? _productBloc;
  CustomerBloc? _customerBloc;
  AuthBloc? _authBloc;
  Map<String, dynamic> activatedPlans = {};

  @override
  void initState() {
    super.initState();
    _productBloc = context.read<ProductBloc>();
    _customerBloc = context.read<CustomerBloc>();
    _authBloc = context.read<AuthBloc>();
    final String userId = _authBloc?.state.user?.id as String;
    _customerBloc?.add(
      GetCustomerEvent(customerId: userId),
    );
    _productBloc?.add(
      GetServices(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.status == BaseStatus.unauthenticated) {
              _sendToLoginScreen();
            }
          },
          child: BlocBuilder<CustomerBloc, CustomerState>(
            builder: (context, customerState) {
              return BlocBuilder<ProductBloc, ProductState>(
                buildWhen: (previousState, newState) {
                  if (newState.cancelProductStatus == BaseStatus.success) {
                    _productBloc?.add(
                      GetProducts(),
                    );

                    Utils.showSnackBar(
                      context: context,
                      message: Constants.serviceCanceledText,
                    );
                    return false;
                  }

                  if (newState.cancelProductStatus == BaseStatus.failed) {
                    Utils.showSnackBar(
                      context: context,
                      message: Constants.productErrorText,
                    );
                    return false;
                  }
                  return true;
                },
                builder: (context, productState) {
                  switch (customerState.status) {
                    case BaseStatus.initialized:
                    case BaseStatus.failed:
                    case BaseStatus.success:
                      return kIsWeb
                        ? ProfileContent(
                            headerColor: themeState.headerColor as Color,
                            textColor: themeState.textColor as Color,
                            activatedPlans: activatedPlans,
                            bambaUser: customerState.user,
                            myServices: productState.myServices,
                            product: productState.products,
                            onCancelService: (serviceId) {
                              _productBloc?.add(
                                CancelService(
                                  bambaService: serviceId,
                                  ),
                                );
                              },
                            )
                          : BambaLayout(
                              child: ProfileContent(
                                headerColor: themeState.headerColor as Color,
                                textColor: themeState.textColor as Color,
                                activatedPlans: activatedPlans,
                                bambaUser: customerState.user,
                                myServices: productState.myServices,
                                product: productState.products,
                                onCancelService: (serviceId) {
                                  _productBloc?.add(
                                    CancelService(
                                      bambaService: serviceId,
                                    ),
                                  );
                                },
                              ),
                            );
                    case BaseStatus.onRequest:
                    case BaseStatus.loading:
                    case BaseStatus.uninitialized:
                      return const ScreenLoadingLogo();
                    default:
                      //TODO: create an error page
                      return Container();
                  }
                },
              );
            },
          ),
        );
      },
    );
  }

  void _sendToLoginScreen() {
    Navigator.pushReplacementNamed(
      context,
      BambaRoutes.login,
    );
  }
}
