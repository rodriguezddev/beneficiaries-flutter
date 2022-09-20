import 'package:get_it/get_it.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../repositories/customer_repository.dart';
import '../repositories/product_repository.dart';
import '../services/customer_service.dart';
import '../services/product_service.dart';
import '../utils/utils.dart';


final serviceLocator = GetIt.instance;

void setUp() async {
  // Get the dio config
  final dio = await Utils.getDio();

  // Services
  serviceLocator.registerSingleton<CustomerService>(
    CustomerService(dio),
  );
  
  serviceLocator.registerSingleton<ProductService>(
    ProductService(dio),
  );

  // Repositories
  serviceLocator.registerSingleton<CustomerRepository>(
    CustomerRepository(),
  );

  serviceLocator.registerSingleton<ProductRepository>(
    ProductRepository(),
  );
}
