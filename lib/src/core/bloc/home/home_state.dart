part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int pageIndex;
  dynamic pageController = PageController(initialPage: 1);

  HomeState({
    this.pageIndex = 1,
    required this.pageController,
  });

  HomeState copyWith({
    int? pageIndex,
    dynamic pageController,
  }) {
    return HomeState(
      pageIndex: pageIndex ?? this.pageIndex,
      pageController: pageController ?? this.pageController,
    );
  }

  @override
  List<Object?> get props => [
    pageIndex,
    pageController,
  ];
}
