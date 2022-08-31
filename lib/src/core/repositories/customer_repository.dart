import '../services/customer_service.dart';

class CustomerRepository {
  CustomerRepository({required this.customerService});

  final CustomerService customerService;
}