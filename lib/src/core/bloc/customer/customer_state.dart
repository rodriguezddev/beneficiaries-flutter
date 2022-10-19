part of 'customer_bloc.dart';

class CustomerState extends Equatable {
  final BaseStatus status;
  final String onErrorMessage;
  final BambaUser? user;

  const CustomerState({
    this.status = BaseStatus.initialized,
    this.onErrorMessage = '',
    this.user,
  });

  CustomerState copyWith({
    BaseStatus? status,
    String? onErrorMessage,
    BambaUser? user,
  }) {
    return CustomerState(
      status: status ?? this.status,
      onErrorMessage: onErrorMessage ?? this.onErrorMessage,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
    status,
    onErrorMessage,
    user,
  ];
}
