import 'package:equatable/equatable.dart';

sealed class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();

  @override
  List<Object> get props => [];
}

class UpdateHomeScreenIndexEvent extends HomeScreenEvent {
  final int index;

  const UpdateHomeScreenIndexEvent({required this.index});
}
