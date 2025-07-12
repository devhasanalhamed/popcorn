import 'package:equatable/equatable.dart';

abstract class SeriesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetAiringTodaySeriesEvent extends SeriesEvent {}

class GetPopularSeriesEvent extends SeriesEvent {}

class GetTopRatedSeriesEvent extends SeriesEvent {}
