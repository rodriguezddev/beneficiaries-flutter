part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final BaseStatus status;
  final String onErrorMessage;
  final BambaUser? user;
  final List<Product>? products;
  final List<BambaService>? myServices;

  const ProfileState({
    this.status = BaseStatus.initialized,
    this.onErrorMessage = '',
    this.user,
    this.products,
    this.myServices,
  });

  ProfileState copyWith({
    BaseStatus? status,
    String? onErrorMessage,
    BambaUser? user,
    List<Product>? products,
    List<BambaService>? myServices,
  }) {
    return ProfileState(
      status: status ?? this.status,
      onErrorMessage: onErrorMessage ?? this.onErrorMessage,
      user: user ?? this.user,
      products: products ?? this.products,
      myServices: myServices ?? this.myServices,
    );
  }

  @override
  List<Object?> get props => [
    status,
    onErrorMessage,
    user,
    products,
    myServices,
  ];
}
