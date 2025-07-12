import 'package:equatable/equatable.dart';

sealed class SeriesDetailsEvent extends Equatable {
  const SeriesDetailsEvent();
}

class GetSeriesDetailsEvent extends SeriesDetailsEvent {
  final int seriesId;

  const GetSeriesDetailsEvent(this.seriesId);

  @override
  List<Object> get props => [seriesId];
}

class GetSeriesRecommnedationsEvent extends SeriesDetailsEvent {
  final int seriesId;

  const GetSeriesRecommnedationsEvent(this.seriesId);

  @override
  List<Object> get props => [seriesId];
}
