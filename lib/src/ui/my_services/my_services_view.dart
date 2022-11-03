import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/constants.dart';
import '../../core/bloc/auth/auth_user/auth_bloc.dart';
import '../../core/utils/base_status.dart';
import '../../core/utils/utils.dart';
import '../kommons/screen_loading_logo.dart';
import '../../core/bloc/customer/customer_bloc.dart';
import '../../core/bloc/product/product_bloc.dart';
import '../services/components/service_success_view.dart';
import 'components/my_services_content.dart';
import '../../core/bloc/theme/theme_bloc.dart';

class MyServicesView extends StatefulWidget {
  const MyServicesView({Key? key}) : super(key: key);

  @override
  _MyServicesView createState() => _MyServicesView();
}

class _MyServicesView extends State<MyServicesView> {
  ProductBloc? _productBloc;
  CustomerBloc? _customerBloc;
  AuthBloc? _authBloc;
  Map<String, dynamic> activatedPlans = {};

  @override
  void initState() {
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
    _productBloc?.add(
      GetProducts(),
    );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return BlocBuilder<CustomerBloc, CustomerState>(
          builder: (context, state) {
            return BlocBuilder<ProductBloc, ProductState>(
              buildWhen: (previousState, newState) {
                if (newState.buyProductStatus == BaseStatus.success) {
                  _productBloc?.add(
                    GetServices(),
                  );
                  _customerBloc?.add(
                    GetCustomerEvent(
                      customerId: state.user?.id as String,
                    ),
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ServiceSuccess(product: activatedPlans),
                    ),
                  );
                  setState(
                    () {
                      activatedPlans = {};
                    },
                  );
                  return false;
                }

                if (newState.buyProductStatus == BaseStatus.failed) {
                  Utils.showSnackBar(
                    context: context,
                    message: newState.onErrorMessage as String,
                  );
                  return false;
                }

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
                switch (state.status) {
                  case BaseStatus.initialized:
                  case BaseStatus.failed:
                  case BaseStatus.success:
                    return MyServicesContent(
                      activatedPlans: activatedPlans,
                      user: state.user,
                      headerColor: themeState.headerColor as Color,
                      myServices: productState.myServices,
                      product: productState.products,
                      productStatus: productState.productStatus,
                      accentControls: themeState.accentControls as Color,
                      subtitleTextColor: themeState.textSubTitleColor as Color,
                      textTitleColor: themeState.textTitleColor as Color,
                      primaryColor: themeState.primaryColor as Color,
                      accentColor: themeState.accentColor as Color,
                      textColor: themeState.textColor as Color,
                      buyPlan: (productsToActive) async {
                        _productBloc?.add(
                          BuyProducts(productsToActive: productsToActive),
                        );
                      },
                      cancelPlan: (bambaService) {
                        _productBloc?.add(
                          CancelService(
                            bambaService: bambaService,
                          ),
                        );
                      },
                    );
                  case BaseStatus.onRequest:
                    return const ScreenLoadingLogo();
                  case BaseStatus.loading:
                    return const ScreenLoadingLogo();
                  case BaseStatus.uninitialized:
                    return const ScreenLoadingLogo();
                  default:
                    //TODO: create an error page
                    return Container();
                }
              },
            );
          },
        );
      },
    );
  }
}
