enum BaseStatus {
  initialized,
  uninitialized,
  unauthenticated,
  success,
  failed,
  paymentMethodRequired,
  onRequest,
  subscriptionRequired,
  conflict,
  authenticated,
  loading,
}

extension BaseStatusExtension on BaseStatus {
  bool get isLoadingData {
    switch (this) {
      case BaseStatus.initialized:
      case BaseStatus.onRequest:
      case BaseStatus.loading:
        return true;
      default:
        return false;
    }
  }

  bool get isLoadingFirst {
    switch (this) {
      case BaseStatus.initialized:
      case BaseStatus.loading:
        return true;
      default:
        return false;
    }
  }
}
