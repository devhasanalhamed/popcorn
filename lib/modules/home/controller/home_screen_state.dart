import 'package:equatable/equatable.dart';

class HomeScreenState extends Equatable {
  final int index;
  const HomeScreenState({required this.index});

  HomeScreenState copyWith({
    int? index,
  }) {
    return HomeScreenState(
      index: index ?? this.index,
    );
  }

  @override
  List<Object> get props => [index];
}
