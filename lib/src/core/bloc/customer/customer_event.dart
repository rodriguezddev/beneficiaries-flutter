part of 'customer_bloc.dart';

@immutable
abstract class CustomerEvent {}

class GetCustomerEvent extends CustomerEvent {
  final String customerId;
  GetCustomerEvent({required this.customerId});
}
