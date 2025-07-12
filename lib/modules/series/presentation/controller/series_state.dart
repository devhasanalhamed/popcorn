import 'package:equatable/equatable.dart';
import 'package:popcorn/core/utils/enums.dart';
import 'package:popcorn/modules/series/domain/entity/series.dart';

class SeriesState extends Equatable {
  // Airing today series
  final List<Series> airingTodaySeries;
  final RequestState airingTodayState;
  final String airingToadyMessage;

  // Popular series
  final List<Series> popularSeries;
  final RequestState popularState;
  final String popularMessage;

  // Top rated series
  final List<Series> topRatedSeries;
  final RequestState topRatedState;
  final String topRatedMessage;

  const SeriesState({
    this.airingTodaySeries = const [],
    this.airingTodayState = RequestState.loading,
    this.airingToadyMessage = '',
    this.popularSeries = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',
    this.topRatedSeries = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
  });

  SeriesState copyWith({
    List<Series>? airingTodaySeries,
    RequestState? airingTodayState,
    String? airingToadyMessage,
    List<Series>? popularSeries,
    RequestState? popularState,
    String? popularMessage,
    List<Series>? topRatedSeries,
    RequestState? topRatedState,
    String? topRatedMessage,
  }) {
    return SeriesState(
      airingTodaySeries: airingTodaySeries ?? this.airingTodaySeries,
      airingTodayState: airingTodayState ?? this.airingTodayState,
      airingToadyMessage: airingToadyMessage ?? this.airingToadyMessage,
      popularSeries: popularSeries ?? this.popularSeries,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedSeries: topRatedSeries ?? this.topRatedSeries,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  @override
  List<Object?> get props => [
        airingTodaySeries,
        airingTodayState,
        airingToadyMessage,
        popularSeries,
        popularState,
        popularMessage,
        topRatedSeries,
        topRatedState,
        topRatedMessage,
      ];
}
